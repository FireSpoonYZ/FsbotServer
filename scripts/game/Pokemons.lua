require('scripts.game.Pokemon')
require('scripts.game.Type')

Pokemons = {}

Pokemons.charizard = Pokemon
        :builder()
        :setName('喷火龙')
        :setProperty('hp', 78)
        :setProperty('atk', 84)
        :setProperty('def', 78)
        :setProperty('spAtk', 109)
        :setProperty('spDef', 85)
        :setProperty('spd', 100)
        :setTypes(Type.fire, Type.flying)
        :build()

Pokemons.blastoise = Pokemon
        :builder()
        :setName('水箭龟')
        :setProperty('hp', 79)
        :setProperty('atk', 83)
        :setProperty('def', 100)
        :setProperty('spAtk', 85)
        :setProperty('spDef', 105)
        :setProperty('spd', 78)
        :setTypes(Type.water)
        :build()

Pokemons.venusaur = Pokemon
        :builder()
        :setName('妙蛙花')
        :setProperty('hp', 80)
        :setProperty('atk', 82)
        :setProperty('def', 83)
        :setProperty('spAtk', 100)
        :setProperty('spDef', 100)
        :setProperty('spd', 80)
        :setTypes(Type.grass, Type.poison)
        :build()

Pokemons.sg = Pokemon
        :builder()
        :setName('水钢')
        :setProperty('hp', 80)
        :setProperty('atk', 50)
        :setProperty('def', 110)
        :setProperty('spAtk', 100)
        :setProperty('spDef', 110)
        :setProperty('spd', 80)
        :setTypes(Type.water, Type.steel)
        :build()
