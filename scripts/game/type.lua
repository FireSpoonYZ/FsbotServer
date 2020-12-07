require('scripts.class')
require('scripts.enum')

Type = enum(
        'normal',
        'fighting',
        'flying',
        'poison',
        'ground',
        'rock',
        'bug',
        'ghost',
        'steel',
        'fire',
        'water',
        'grass',
        'electric',
        'psychic',
        'ice',
        'dragon',
        'dark',
        'fairy'
)

Type.normal = Type('normal')
Type.fighting = Type('fighting')
Type.flying = Type('flying')
Type.poison = Type('poison')
Type.ground = Type('ground')
Type.rock = Type('rock')
Type.bug = Type('bug')
Type.ghost = Type('ghost')
Type.steel = Type('steel')
Type.fire = Type('fire')
Type.water = Type('water')
Type.grass = Type('grass')
Type.electric = Type('electric')
Type.psychic = Type('psychic')
Type.ice = Type('ice')
Type.dragon = Type('dragon')
Type.dark = Type('dark')
Type.fairy = Type('fairy')

local superEffectiveMap = {}
superEffectiveMap[Type.normal] = {}
superEffectiveMap[Type.fighting] = { Type.normal, Type.rock, Type.steel, Type.ice, Type.dark }
superEffectiveMap[Type.flying] = { Type.fighting, Type.bug, Type.grass }
superEffectiveMap[Type.poison] = { Type.grass, Type.fairy }
superEffectiveMap[Type.ground] = { Type.poison, Type.rock, Type.steel, Type.fire, Type.electric }
superEffectiveMap[Type.rock] = { Type.flying, Type.bug, Type.fire, Type.ice }
superEffectiveMap[Type.bug] = { Type.grass, Type.psychic, Type.dark }
superEffectiveMap[Type.ghost] = { Type.ghost, Type.psychic }
superEffectiveMap[Type.steel] = { Type.rock, Type.ice, Type.fairy }
superEffectiveMap[Type.fire] = { Type.bug, Type.steel, Type.grass, Type.ice }
superEffectiveMap[Type.water] = { Type.ground, Type.rock, Type.fire }
superEffectiveMap[Type.grass] = { Type.ground, Type.rock, Type.water }
superEffectiveMap[Type.electric] = { Type.flying, Type.water }
superEffectiveMap[Type.psychic] = { Type.fighting, Type.poison }
superEffectiveMap[Type.ice] = { Type.flying, Type.ground, Type.grass, Type.dragon }
superEffectiveMap[Type.dragon] = { Type.dragon }
superEffectiveMap[Type.dark] = { Type.ghost, Type.psychic }
superEffectiveMap[Type.fairy] = { Type.fighting, Type.dragon, Type.dark }

local notVeryEffectiveMap = {}
notVeryEffectiveMap[Type.normal] = { Type.rock, Type.steel }
notVeryEffectiveMap[Type.fighting] = { Type.flying, Type.poison, Type.bug, Type.psychic, Type.fairy }
notVeryEffectiveMap[Type.flying] = { Type.rock, Type.steel, Type.electric }
notVeryEffectiveMap[Type.poison] = { Type.poison, Type.ground, Type.rock, Type.ghost }
notVeryEffectiveMap[Type.ground] = { Type.grass, Type.bug }
notVeryEffectiveMap[Type.rock] = { Type.fighting, Type.ground, Type.steel }
notVeryEffectiveMap[Type.bug] = { Type.fighting, Type.flying, Type.poison, Type.ghost, Type.steel, Type.fire, Type.fairy }
notVeryEffectiveMap[Type.ghost] = { Type.dark }
notVeryEffectiveMap[Type.steel] = { Type.steel, Type.fire, Type.water, Type.electric }
notVeryEffectiveMap[Type.fire] = { Type.rock, Type.fire, Type.water, Type.dragon }
notVeryEffectiveMap[Type.water] = { Type.water, Type.grass, Type.dragon }
notVeryEffectiveMap[Type.grass] = { Type.flying, Type.poison, Type.bug, Type.steel, Type.fire, Type.dragon }
notVeryEffectiveMap[Type.electric] = { Type.grass, Type.electric, Type.dragon }
notVeryEffectiveMap[Type.psychic] = { Type.steel, Type.psychic }
notVeryEffectiveMap[Type.ice] = { Type.steel, Type.fire, Type.water, Type.ice }
notVeryEffectiveMap[Type.dragon] = { Type.steel }
notVeryEffectiveMap[Type.dark] = { Type.fighting, Type.dark, Type.fairy }
notVeryEffectiveMap[Type.fairy] = { Type.poison, Type.steel, Type.fire }

local notEffectiveMap = {}
notEffectiveMap[Type.normal] = { Type.ghost }
notEffectiveMap[Type.fighting] = { Type.ghost }
notEffectiveMap[Type.flying] = {}
notEffectiveMap[Type.poison] = { Type.steel }
notEffectiveMap[Type.ground] = { Type.flying }
notEffectiveMap[Type.rock] = {}
notEffectiveMap[Type.bug] = {}
notEffectiveMap[Type.ghost] = { Type.normal }
notEffectiveMap[Type.steel] = {}
notEffectiveMap[Type.fire] = {}
notEffectiveMap[Type.water] = {}
notEffectiveMap[Type.grass] = {}
notEffectiveMap[Type.electric] = { Type.ground }
notEffectiveMap[Type.psychic] = { Type.dark }
notEffectiveMap[Type.ice] = {}
notEffectiveMap[Type.dragon] = { Type.fairy }
notEffectiveMap[Type.dark] = {}
notEffectiveMap[Type.fairy] = {}

function Type:superEffective(another)
    for _, type in pairs(superEffectiveMap[self]) do
        if type == another then
            return true
        end
    end
    return false
end
function Type:notVeryEffective(another)
    for _, type in pairs(notVeryEffectiveMap[self]) do
        if type == another then
            return true
        end
    end
    return false
end
function Type:notEffective(another)
    for _, type in pairs(notEffectiveMap[self]) do
        if type == another then
            return true
        end
    end
    return false
end