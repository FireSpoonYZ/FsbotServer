require('scripts.class')
require('scripts.game.pokemonentity')

PokemonEntityInBattle = class()
function PokemonEntityInBattle:__init__(pokemonEntity)
    assert(instanceof(pokemonEntity, PokemonEntity))

    local metatable = getmetatable(self)
    local index = metatable.__index
    metatable.__index = function(inst, key)
        if key == 'hp' then
            return inst.pokemonEntity.hp
        else
            return index(inst, key)
        end
    end
    metatable.__newindex = function(inst, key, value)
        if key == 'hp' then
            inst.pokemonEntity.hp = value
        else
            rawset(inst, key, value)
        end
    end

    self.pokemonEntity = pokemonEntity
    self.propertyStats = {}
    self.propertyStats.atk = 0
    self.propertyStats.def = 0
    self.propertyStats.spAtk = 0
    self.propertyStats.spDef = 0
    self.propertyStats.spd = 0

    self:updateProperties()

    self.types = {}
    for _, type in pairs(pokemonEntity.types) do
        table.insert(self.types, type)
    end

    self.talent = self.pokemonEntity.talent
end

function PokemonEntityInBattle:updateProperties()
    self.pokemonEntity:updateProperties()

    self.hp = self.pokemonEntity.hp
    self.maxHp = self.pokemonEntity.maxHp

    local propertyNames = {'atk', 'def', 'spAtk', 'spDef', 'spd'}
    for _, name in pairs(propertyNames) do
        local property = self.pokemonEntity[name]
        local stat = self.propertyStats[name]
        if stat > 0 then
            self[name] = property * (2 + stat) / 2
        else
            self[name] = property * 2 / (2 - stat)
        end
    end
end

function PokemonEntityInBattle:setHp(value)
    self.pokemonEntity.hp = value
end

function PokemonEntityInBattle:propertyStatUp(name, value)
    self.propertyStats[name] = self.propertyStats[name] + value
    if self.propertyStats[name] < -6 then
        self.propertyStats[name] = -6
    elseif self.propertyStats[name] > 6 then
        self.propertyStats[name] = 6
    end
    self:updateProperties()
end

function PokemonEntityInBattle:setTalent(talent)
    self.talent = talent
end