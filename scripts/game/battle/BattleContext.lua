require('scripts.utils.class')
require('scripts.event.EventBus')
require('scripts.game.battle.PokemonEntityInBattle')
require('scripts.game.battle.SkillContext')
require('scripts.game.battle.Side')
require('scripts.game.battle.TalentManager')

BattleContext = class()
function BattleContext:__init(entities, onStage)
    self.eventBus = EventBus()
    self.entities = List(List(), List())
    self.stage = List(List(), List())
    self.backup = List(List(), List())
    entities:indices():foreach(function(side)
        entities[side]:foreach(function(e)
            local entity = PokemonEntityInBattle(self, e, side)
            self.entities[side]:add(entity)
            if onStage[side]:contains(e) then
                self.stage[side]:add(entity)
            else
                self.backup[side]:add(entity)
            end
        end)
    end)
    self.displayer = Displayer(self.stage)
    self.talentManager = TalentManager()

    self.eventBus:subscribe(Handler('DieEvent',
            function(event)
                local target = event.damageContext.target
                local side = target.side
                local flag = true
                self.entities[side]:foreach(function(entity)
                    if entity.dying == false then
                        flag = false
                    end
                end)
                if flag then
                    error('战斗结束！')
                end
            end)
    , 10086)

    self.eventBus:subscribe(Handler('__any',
            function(event)
                self.talentManager:publish(event)
            end))

    self.entities:foreach(function(v)
        v:foreach(function(entity)
            self.talentManager:register(entity)
        end)
    end)
end

function BattleContext:execute()
    self.stage:foreach(function(entities)
        entities:foreach(function(entity)
            self:entityComeOnStage(entity)
        end)
    end)

    while true do
        self.displayer:display()
        self.displayer:pushMessage('')

        local skillContextList = List()
        self.stage:indices():foreach(function(side)
            self.stage[side]:foreach(function(entity)
                local context = SkillContext(
                        self,
                        entity,
                        List({ side = self:anotherSide(side), pos = 1 }),
                        entity.skills[1]
                )
                skillContextList:add(context)
            end)
        end)

        skillContextList:sort(function(a, b)
            local priA = a.skill.priority
            local priB = b.skill.priority
            local spdA = a.actor.spd
            local spdB = b.actor.spd
            if priA ~= priB then
                return priA > priB
            elseif spdA ~= spdB then
                return spdA > spdB
            else
                return math.random() > 0.5
            end
        end)

        skillContextList:foreach(function(v)
            if not v.actor.dying then
                v:execute()
            end
        end)

        self.stage:foreach(function(entities)
            entities:indices():foreach(function(stagePos)
                local entity = entities[stagePos]
                if entity.dying then
                    local side = entity.side
                    self:switch(side, stagePos, 1)
                end
            end)
        end)

        self.displayer:pushMessage('')
        self.displayer:display()
        self.displayer:pushMessage('')
        self.displayer:pushMessage('')
        self.displayer:pushMessage('')
    end
    --end)
end

function BattleContext:entityComeOnStage(entity)
    self.talentManager:on(entity)
    self.displayer:pushMessage('放出了 ' .. entity.name)
    local event = Event('EntityComeOnStageEvent', {
        battleContext = self,
        entity = entity
    })
    self.eventBus:publish(event)
end

function BattleContext:entityLeaveStage(entity)
    self.talentManager:off(entity)
    self.displayer:pushMessage('收回了 ' .. entity.name)
    self.eventBus:publish(Event('EntityLeaveStageEvent', {
        battleContext = self,
        entity = entity
    }))
end

function BattleContext:entitySwitchIn(entity, pos)
    local side = entity.side
    self.stage[side][pos] = entity
    self:entityComeOnStage(entity)
end

function BattleContext:entitySwitchOut(entity, pos)
    local side = entity.side
    self.backup[side][pos] = entity
    self:entityLeaveStage(entity)
end

function BattleContext:switch(side, stagePos, backupPos)
    local stageEntity = self.stage[side][stagePos]
    local backupEntity = self.backup[side][backupPos]

    if backupEntity.dying then
        return
    end

    self.eventBus:publish(Event('EntitySwitchEvent', {
        battleContext = self,
        side = side,
        stagePos = stagePos,
        backupPos = backupPos
    }))

    self:entitySwitchOut(stageEntity, backupPos)
    self:entitySwitchIn(backupEntity, stagePos)
end

function BattleContext:anotherSide(side)
    if type(side) == 'number' then
        return 3 - side
    elseif instanceof(side, PokemonEntityInBattle) then
        return self:anotherSide(side.side)
    end
end
