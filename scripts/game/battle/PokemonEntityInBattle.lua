require('scripts.utils.class')
--require('scripts.game.battle.BattleContext')
require('scripts.game.PokemonEntity')

PokemonEntityInBattle = class()
function PokemonEntityInBattle:__init(battleContext, pokemonEntity, side)
    self.battleContext = battleContext
    self.pokemonEntity = pokemonEntity
    self.side = side

    self.propertyMults = {}
    self.propertyMults.atk = 1
    self.propertyMults.def = 1
    self.propertyMults.spAtk = 1
    self.propertyMults.spDef = 1
    self.propertyMults.spd = 1

    self.propertyStats = {}
    self.propertyStats.atk = 0
    self.propertyStats.def = 0
    self.propertyStats.spAtk = 0
    self.propertyStats.spDef = 0
    self.propertyStats.spd = 0

    self:updateProperties()

    self.types = pokemonEntity.types:copy()

    self.talent = self.pokemonEntity.talent

    self.ctLevel = 0
end

function PokemonEntityInBattle:__index(key)
    local value = rawget(self, key)
    value = value or self.pokemonEntity[key]
    return value
end

function PokemonEntityInBattle:updateProperties()
    self.pokemonEntity:updateProperties()

    self.hp = self.pokemonEntity.hp
    self.maxHp = self.pokemonEntity.maxHp

    local propertyNames = { 'atk', 'def', 'spAtk', 'spDef', 'spd' }
    for _, name in pairs(propertyNames) do
        local value = self.pokemonEntity[name]
        local stat = self.propertyStats[name]
        if stat > 0 then
            value = value * (2 + stat) / 2
        else
            value = value * 2 / (2 - stat)
        end
        value = value * self.propertyMults[name]
        self[name] = value
    end
end

function PokemonEntityInBattle:propertyStatUp(name, value)

    self.propertyStats[name] = self.propertyStats[name] + value
    if self.propertyStats[name] < -6 then
        self.propertyStats[name] = -6
    elseif self.propertyStats[name] > 6 then
        self.propertyStats[name] = 6
    end

    self:updateProperties()


    local delta = ''
    if value > 0 then
        delta = '上升'
    else
        delta = '下降'
        value = -value
    end
    local msg = self.name .. ' 的 ' .. name .. ' ' .. delta .. '了 ' .. value .. ' 个等级'
    self.battleContext.displayer:pushMessage(msg)
    msg = self.name .. ' 的 ' .. name .. ' 等级变成了 ' .. self.propertyStats[name]
    self.battleContext.displayer:pushMessage(msg)
end

function PokemonEntityInBattle:setTalent(talent)
    self.talent = talent
end
