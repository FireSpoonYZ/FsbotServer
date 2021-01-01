require('scripts.utils.class')
require('scripts.utils.List')
require('scripts.game.Type')

Pokemon = class()
function Pokemon:__init(name, hp, atk, def, spAtk, spDef, spd, types)
    self.name = name
    self.hp = hp
    self.atk = atk
    self.def = def
    self.spAtk = spAtk
    self.spDef = spDef
    self.spd = spd
    self.types = types
end
function Pokemon:builder()
    return PokemonBuilder()
end

PokemonBuilder = class()
function PokemonBuilder:setName(name)
    self.name = name
    return self
end
function PokemonBuilder:setProperty(name, value)
    self[name] = value
    return self
end
function PokemonBuilder:setTypes(...)
    self.types = List(...)
    return self
end
function PokemonBuilder:build()
    return Pokemon(self.name, self.hp, self.atk, self.def, self.spAtk, self.spDef, self.spd, self.types)
end
