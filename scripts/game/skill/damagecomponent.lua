require('scripts.class')
require('scripts.game.battle.skillcontext')
require('scripts.game.battle.damagecontext')
require('scripts.event.event')

DamageComponent = class()
function DamageComponent:__init__(power, damageType, physical, ctLevel)
    assert(type(power) == 'number')
    assert(power > 0)
    assert(instanceof(damageType, Type))
    assert(type(physical) == 'boolean')
    assert(type(ctLevel) == 'number' or ctLevel == nil)

    self.power = power
    self.type = damageType
    self.physical = physical
    self.ctLevel = ctLevel or 0
end

function DamageComponent:execute(event)
    assert(instanceof(event, Event))

    local eventBus = event.battleContext.eventBus

    for _, _target in pairs(event.targets) do
        local bsdEvent = Event(
                'BeforeSkillDamageEvent',
                {
                    source = event.actor,
                    target = _target,
                    power = self.power,
                    type = self.type,
                    physical = self.physical,
                    sameTypeBonus = 1.5,
                    effectBonus = 2,
                    notEffectBonus = 0.5,
                    ctBonus = 1.5,
                    ctLevel = self.ctLevel,
                    otherBonus = 1,
                }
        )
        eventBus:publish(bsdEvent)

        local source = bsdEvent.source
        local target = bsdEvent.target
        local damageType = bsdEvent.type

        local level = source.pokemonEntity.level

        local atk = source.atk
        local def = target.def

        if not event.physical then
            atk = source.spAtk
            def = target.spDef
        end

        local damage = ((2 * level + 10) / 250 * atk / def * bsdEvent.power + 2)

        for _, type in pairs(source.types) do
            if damageType == type then
                damage = damage * bsdEvent.sameTypeBonus
            end
        end

        for _, type in pairs(target.types) do
            if damageType:superEffective(type) then
                damage = damage * bsdEvent.effectBonus
            elseif damageType:notVeryEffective(type) then
                damage = damage * bsdEvent.notEffectBonus
            elseif damageType:notEffective(type) then
                damage = 0
            end
        end

        damage = damage * bsdEvent.otherBonus
        damage = damage * math.random(85, 100) / 100
        damage = math.floor(damage)

        DamageContext(
                event.battleContext,
                source,
                target,
                damage,
                damageType
        ):execute()
    end
end
