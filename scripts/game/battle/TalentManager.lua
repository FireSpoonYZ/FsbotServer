require('scripts.utils.class')
require('scripts.event.EventBus')
require('scripts.utils.List')
require('scripts.game.battle.PriAndSpd')

TalentManager = class()
function TalentManager:__init()
    self.eventBus = EventBus()
    self.active = {}
end

function TalentManager:publish(event)
    self.eventBus:publish(event)
end

function TalentManager:register(entity)
    local talent = entity.talent

    talent.effects:foreach(function(effect)
        local handler = Handler(
                effect.eventName,
                function(event)
                    if self.active[entity] then
                        effect.onEvent(entity, event)
                    end
                end,
                PriAndSpd(entity, effect.priority)
        )
        self.eventBus:subscribe(handler)
    end)

    self:off(entity)
end

function TalentManager:on(entity)
    self.active[entity] = true
end

function TalentManager:off(entity)
    self.active[entity] = false
end
