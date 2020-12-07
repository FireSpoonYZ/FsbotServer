require('scripts.game.battle.battlecontext')
require('scripts.game.pokemonentity')
require('scripts.game.pokemons')
require('scripts.game.skill.skills')
require('scripts.game.talent.talents')
require('scripts.event.handler')

math.randomseed(os.time())
math.random()

local venusaur = PokemonEntity(Pokemons.venusaur)
venusaur.name = '蒜头王八1'
venusaur:levelUp(49)
venusaur:addSkill(Skills.EnergyBall)
venusaur:setTalent(Talents.temp1)

local charizard = PokemonEntity(Pokemons.charizard)
charizard.name = '喷火龙1'
charizard:levelUp(49)
charizard:addSkill(Skills.HeatWave)
charizard:setTalent(Talents.temp2)

local context = BattleContext({ charizard }, { venusaur })
context.eventBus:subscribe(
        Handler('AfterDamageEvent', function(event)
            local source = event.source.pokemonEntity
            local target = event.target.pokemonEntity
            print(source.name .. ' 对 ' .. target.name .. ' 造成了 ' .. event.damage .. '点伤害')
        end)
)
context:execute()
