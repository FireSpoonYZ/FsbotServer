require('scripts.utils.class')

SkillDamageContext = class()

function SkillDamageContext:__init(battleContext, actor, target, damageComponent)
    self.battleContext = battleContext
    self.source = actor
    self.target = target
    self.damageComponent = damageComponent
end

function SkillDamageContext:execute()
    local eventBus = self.battleContext.eventBus

    local source = self.source
    local target = self.target

    local extra = {
        context = self,
        sourceLevel = source.pokemonEntity.level,
        sourceTypes = source.types:copy(),
        targetTypes = target.types:copy(),
        damageTypes = self.damageComponent.damageTypes,
        physical = self.damageComponent.physical
    }
    local s1Event = Event('SkillDamageCalcStage1Event', extra)
    eventBus:publish(s1Event)

    extra.sameTypeBonus = 1.5
    extra.effectBonus = 2
    extra.notEffectBonus = 0.5
    extra.ctBonus = 1.5
    local s2Event = Event('SkillDamageCalcStage2Event', extra)
    eventBus:publish(s2Event)

    local atk = self.source.atk
    local def = self.target.def

    if not extra.physical then
        atk = self.source.spAtk
        def = self.target.spDef
    end

    local sameType = false
    for _, type in pairs(s1Event.sourceTypes) do
        for _, damageType in pairs(extra.damageTypes) do
            if damageType == type then
                sameType = true
            end
        end
    end

    local counterRate = 1
    for _, type in pairs(s1Event.targetTypes) do
        for _, damageType in pairs(extra.damageTypes) do
            if damageType:superEffective(type) then
                counterRate = counterRate * extra.effectBonus
            elseif damageType:notVeryEffective(type) then
                counterRate = counterRate * extra.notEffectBonus
            elseif damageType:notEffective(type) then
                counterRate = 0
            end
        end
    end

    extra.atk = atk
    extra.def = def
    extra.sameType = sameType
    extra.counterRate = counterRate
    extra.otherBonus = 1
    local s3Event = Event('SkillDamageCalcStage3Event', extra)
    eventBus:publish(s3Event)

    local damage = ((2 * extra.sourceLevel + 10) / 250 * extra.atk / extra.def * self.damageComponent.power + 2)

    damage = damage * extra.counterRate

    local message = ''
    if counterRate > 1 then
        message = '效果拔群！'
    elseif counterRate == 0 then
        message = '似乎没有效果'
    elseif counterRate < 1 then
        message = '效果不理想'
    end
    self.battleContext.displayer:pushMessage(message)

    if extra.sameType then
        damage = damage * extra.sameTypeBonus
    end

    damage = damage * extra.otherBonus
    damage = damage * math.random(85, 100) / 100
    damage = math.floor(damage)

    DamageContext(
            self.battleContext,
            self.source,
            self.target,
            damage,
            extra.damageTypes
    ):execute()
end

--[[
function SkillDamageContext:execute()
    local eventBus = self.battleContext.eventBus

    eventBus:publish(Event('BeforeSkillDamageEvent', self))

    local source = self.source
    local target = self.target
    local damageType = self.type

    local level = source.pokemonEntity.level

    local atk = source.atk
    local def = target.def

    if not self.physical then
        atk = source.spAtk
        def = target.spDef
    end

    local damage = ((2 * level + 10) / 250 * atk / def * self.power + 2)

    for _, type in pairs(source.types) do
        if damageType == type then
            damage = damage * self.sameTypeBonus
        end
    end

    local counterBonus = 1
    for _, type in pairs(target.types) do
        if damageType:superEffective(type) then
            counterBonus = counterBonus * self.effectBonus
        elseif damageType:notVeryEffective(type) then
            counterBonus = counterBonus * self.notEffectBonus
        elseif damageType:notEffective(type) then
            counterBonus = 0
        end
    end
    damage = damage * counterBonus
    if counterBonus > 1 then
        self.battleContext:putMsg('效果拔群！')
    elseif counterBonus == 0 then
        self.battleContext:putMsg('似乎没有效果')
    elseif counterBonus < 1 then
        self.battleContext:putMsg('效果不理想')
    end

    damage = damage * self.otherBonus
    damage = damage * math.random(85, 100) / 100
    damage = math.floor(damage)

    DamageContext(
            self.battleContext,
            source,
            target,
            damage,
            damageType
    ):execute()
end
]]