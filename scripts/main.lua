require('scripts.game.battle.BattleContext')
require('scripts.game.PokemonEntity')
require('scripts.game.Pokemons')
require('scripts.game.skill.Skills')
require('scripts.game.talent.Talents')
require('scripts.event.handler')
require('scripts.game.displayer.Displayer')

math.randomseed(os.time())
math.random()

local venusaur = PokemonEntity(Pokemons.venusaur)
venusaur.name = '蒜头王八1'
venusaur:levelUp(59)
venusaur:addSkill(Skills.EnergyBall)
venusaur:setTalent(Talents.empty)

local sg = PokemonEntity(Pokemons.sg)
sg.name = '水缸'
sg:levelUp(49)
sg:addSkill(Skills.WaterSwitch)
sg:setTalent(Talents.temp1)

local charizard = PokemonEntity(Pokemons.charizard)
charizard.name = '喷火龙1'
charizard:levelUp(49)
charizard:addSkill(Skills.EnergyBall)
charizard:setTalent(Talents.empty)

local context = BattleContext(
        List(
                List(sg, charizard),
                List(venusaur)
        ),
        List(
                List(sg),
                List(venusaur)
        )
)
context:execute()
