require('scripts.class')
require('scripts.event.eventbus')
require('scripts.game.battle.pokemonentityinbattle')
require('scripts.game.battle.skillcontext')

BattleContext = class()
function BattleContext:__init__(owns, enemies)
    self.eventBus = EventBus()
    self.owns = {}
    for _, v in ipairs(owns) do
        table.insert(self.owns, PokemonEntityInBattle(v))
    end
    self.enemies = {}
    for _, v in ipairs(enemies) do
        table.insert(self.enemies, PokemonEntityInBattle(v))
    end
    self.talentController = {}
end

function BattleContext:execute()
    for _, v in pairs(self.owns) do
        local talent = v.talent
        self.talentController[v] = {}
        for _, effect in pairs(talent.effects) do
            local handler = Handler(effect.eventName, function(event)
                effect.onEvent(v, event)
            end)
            table.insert(self.talentController[v], handler)
        end
    end

    for _, v in pairs(self.enemies) do
        local talent = v.talent
        self.talentController[v] = {}
        for _, effect in pairs(talent.effects) do
            local handler = Handler(effect.eventName, function(event)
                effect.onEvent(v, event)
            end)
            table.insert(self.talentController[v], handler)
        end
    end

    for _, v in pairs(self.talentController) do
        for _, handler in pairs(v) do
            self.eventBus:subscribe(handler)
        end
    end

    local skillContextList = {}
    for _, v in pairs(self.owns) do
        local context = SkillContext(self, v, self.enemies, v.pokemonEntity.skills[1])
        table.insert(skillContextList, context)
    end
    for _, v in pairs(self.enemies) do
        local context = SkillContext(self, v, self.owns, v.pokemonEntity.skills[1])
        table.insert(skillContextList, context)
    end

    table.sort(skillContextList, function(a, b)
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

    for _, sc in pairs(skillContextList) do
        sc:execute()
    end
end
