require('scripts.class')

SkillContext = class()
function SkillContext:__init__(battleContext, actor, targets, skill)
    assert(instanceof(battleContext, BattleContext))
    assert(instanceof(actor, PokemonEntityInBattle))
    assert(type(targets) == 'table')
    for _, v in pairs(targets) do
        assert(instanceof(v, PokemonEntityInBattle))
    end
    assert(instanceof(skill, Skill))

    self.battleContext = battleContext
    self.actor = actor
    self.targets = targets
    self.skill = skill
end

function SkillContext:execute()
    local eventBus = self.battleContext.eventBus

    local bsEvent = Event('BeforeSkillEvent', {
        battleContext = self.battleContext,
        actor = self.actor,
        targets = self.targets,
        skill = self.skill
    })
    eventBus:publish(bsEvent)

    for _, component in pairs(self.skill.components) do
        component:execute(bsEvent)
    end

    eventBus:publish(Event('AfterSkillEvent', {
        actor = self.actor,
        targets = self.targets,
        skill = self.skill
    }))
end
