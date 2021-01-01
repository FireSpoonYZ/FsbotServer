require('scripts.utils.class')
require('scripts.utils.List')

SkillContext = class()
function SkillContext:__init(battleContext, actor, targets, skill)
    self.battleContext = battleContext
    self.actor = actor
    self.targets = targets
    self.skill = skill
end

function SkillContext:execute()
    local battleContext = self.battleContext
    local eventBus = battleContext.eventBus
    self.targets = self.targets:deduction(function(target)
        return battleContext.stage[target.side][target.pos]
    end)

    eventBus:publish(Event('BeforeSkillEvent', self))

    local message = self.actor.name ..
            " 使用了 " ..
            self.skill.name

    self.battleContext.displayer:pushMessage(message)

    self.skill.components:foreach(function(component)
        component:execute(self)
    end)

    eventBus:publish(Event('AfterSkillEvent', self))
end
