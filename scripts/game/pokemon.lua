require('scripts.class')
require('scripts.game.type')

Pokemon = class()
function Pokemon:__init__(name, hp, atk, def, spAtk, spDef, spd, types)
    assert(type(name) == 'string')
    assert(type(hp) == 'number')
    assert(type(atk) == 'number')
    assert(type(def) == 'number')
    assert(type(spAtk) == 'number')
    assert(type(spDef) == 'number')
    assert(type(spd) == 'number')
    assert(type(types) == 'table')
    for _, v in ipairs(types) do
        assert(isObject(v))
        assert(v.__class__ == Type)
    end

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
    self.types = { ... }
    return self
end
function PokemonBuilder:build()
    return Pokemon(self.name, self.hp, self.atk, self.def, self.spAtk, self.spDef, self.spd, self.types)
end
