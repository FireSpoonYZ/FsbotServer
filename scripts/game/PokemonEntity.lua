require('scripts.game.Pokemon')
require('scripts.game.skill.Skill')

PokemonEntity = class()
function PokemonEntity:__init(pokemon)
    self.pokemon = pokemon
    self.level = 1

    self.basePoint = {}
    self.basePoint.hp = 0
    self.basePoint.atk = 0
    self.basePoint.def = 0
    self.basePoint.spAtk = 0
    self.basePoint.spDef = 0
    self.basePoint.spd = 0
    self.totalBasePoint = 0

    self.ivs = {}
    self.ivs.hp = 31
    self.ivs.atk = 31
    self.ivs.def = 31
    self.ivs.spAtk = 31
    self.ivs.spDef = 31
    self.ivs.spd = 31

    self.skills = {}

    self.dying = false

    self:updateProperties()
end

function PokemonEntity:__index(key)
    if key == 'types' then
        return self.pokemon.types
    else
        return rawget(self, key)
    end
end

function PokemonEntity:updateProperties()
    local hpPre
    if self.hp == nil or self.maxHp == nil then
        hpPre = 1
    else
        hpPre = self.hp / self.maxHp
    end

    --(种族值 * 2 + 个体值 + 努力值 / 4) * 等级 / 100 + 10 + 等级
    self.maxHp = math.floor(
            (self.pokemon.hp * 2 + self.ivs.hp + self.basePoint.hp / 4) * self.level / 100 + 10 + self.level
    )
    self.hp = math.floor(self.maxHp * hpPre)
    local propertyNames = { 'atk', 'def', 'spAtk', 'spDef', 'spd' }
    for _, name in pairs(propertyNames) do
        --(种族值 * 2 + 个体值 + 努力值 / 4) * 等级 / 100 + 5
        self[name] = math.floor(
                (self.pokemon[name] * 2 + self.ivs[name] + self.basePoint[name] / 4) * self.level / 100 + 5
        )
    end
end

function PokemonEntity:levelUp(value)
    assert(type(value) == 'number' or value == nil)

    self.level = self.level + (value or 1)
    self:updateProperties()
end

function PokemonEntity:gainBasePoint(name, value)
    assert(type(name) == 'string')
    assert(type(self.basePoint[name]) == 'number')
    assert(type(value) == 'number' or value == nil)

    local tValue = value
    if self.basePoint[name] + tValue > 252 then
        tValue = 252 - self.basePoint[name]
    elseif self.basePoint[name] + tValue < 0 then
        tValue = -self.basePoint[name]
    end
    self.basePoint[name] = self.basePoint[name] + tValue
    self.totalBasePoint = self.totalBasePoint + tValue
    self:updateProperties()
end

function PokemonEntity:addSkill(skill)
    assert(instanceof(skill, Skill))
    table.insert(self.skills, skill)
end

function PokemonEntity:setTalent(talent)
    assert(instanceof(talent, Talent))
    self.talent = talent
end
