require('scripts.utils.enum')

Type = enum({
    normal = '普通',
    fighting = '格斗',
    flying = '飞行',
    poison = '毒',
    ground = '地面',
    rock = '岩石',
    bug = '虫',
    ghost = '幽灵',
    steel = '钢',
    fire = '火',
    water = '水',
    grass = '草',
    electric = '电',
    psychic = '超能',
    ice = '冰',
    dragon = '龙',
    dark = '恶',
    fairy = '妖精',
})

function Type:superEffective(another)
    local superEffectiveMap = {}
    superEffectiveMap[Type.normal] = List()
    superEffectiveMap[Type.fighting] = List(Type.normal, Type.rock, Type.steel, Type.ice, Type.dark)
    superEffectiveMap[Type.flying] = List(Type.fighting, Type.bug, Type.grass)
    superEffectiveMap[Type.poison] = List(Type.grass, Type.fairy)
    superEffectiveMap[Type.ground] = List(Type.poison, Type.rock, Type.steel, Type.fire, Type.electric)
    superEffectiveMap[Type.rock] = List(Type.flying, Type.bug, Type.fire, Type.ice)
    superEffectiveMap[Type.bug] = List(Type.grass, Type.psychic, Type.dark)
    superEffectiveMap[Type.ghost] = List(Type.ghost, Type.psychic)
    superEffectiveMap[Type.steel] = List(Type.rock, Type.ice, Type.fairy)
    superEffectiveMap[Type.fire] = List(Type.bug, Type.steel, Type.grass, Type.ice)
    superEffectiveMap[Type.water] = List(Type.ground, Type.rock, Type.fire)
    superEffectiveMap[Type.grass] = List(Type.ground, Type.rock, Type.water)
    superEffectiveMap[Type.electric] = List(Type.flying, Type.water)
    superEffectiveMap[Type.psychic] = List(Type.fighting, Type.poison)
    superEffectiveMap[Type.ice] = List(Type.flying, Type.ground, Type.grass, Type.dragon)
    superEffectiveMap[Type.dragon] = List(Type.dragon)
    superEffectiveMap[Type.dark] = List(Type.ghost, Type.psychic)
    superEffectiveMap[Type.fairy] = List(Type.fighting, Type.dragon, Type.dark)

    return superEffectiveMap[self]:contains(another)
end

function Type:notVeryEffective(another)
    local notVeryEffectiveMap = {}
    notVeryEffectiveMap[Type.normal] = List(Type.rock, Type.steel)
    notVeryEffectiveMap[Type.fighting] = List(Type.flying, Type.poison, Type.bug, Type.psychic, Type.fairy)
    notVeryEffectiveMap[Type.flying] = List(Type.rock, Type.steel, Type.electric)
    notVeryEffectiveMap[Type.poison] = List(Type.poison, Type.ground, Type.rock, Type.ghost)
    notVeryEffectiveMap[Type.ground] = List(Type.grass, Type.bug)
    notVeryEffectiveMap[Type.rock] = List(Type.fighting, Type.ground, Type.steel)
    notVeryEffectiveMap[Type.bug] = List(Type.fighting, Type.flying, Type.poison, Type.ghost, Type.steel, Type.fire, Type.fairy)
    notVeryEffectiveMap[Type.ghost] = List(Type.dark)
    notVeryEffectiveMap[Type.steel] = List(Type.steel, Type.fire, Type.water, Type.electric)
    notVeryEffectiveMap[Type.fire] = List(Type.rock, Type.fire, Type.water, Type.dragon)
    notVeryEffectiveMap[Type.water] = List(Type.water, Type.grass, Type.dragon)
    notVeryEffectiveMap[Type.grass] = List(Type.flying, Type.poison, Type.bug, Type.steel, Type.fire, Type.dragon)
    notVeryEffectiveMap[Type.electric] = List(Type.grass, Type.electric, Type.dragon)
    notVeryEffectiveMap[Type.psychic] = List(Type.steel, Type.psychic)
    notVeryEffectiveMap[Type.ice] = List(Type.steel, Type.fire, Type.water, Type.ice)
    notVeryEffectiveMap[Type.dragon] = List(Type.steel)
    notVeryEffectiveMap[Type.dark] = List(Type.fighting, Type.dark, Type.fairy)
    notVeryEffectiveMap[Type.fairy] = List(Type.poison, Type.steel, Type.fire)

    return notVeryEffectiveMap[self]:contains(another)
end
function Type:notEffective(another)
    local notEffectiveMap = {}
    notEffectiveMap[Type.normal] = List(Type.ghost)
    notEffectiveMap[Type.fighting] = List(Type.ghost)
    notEffectiveMap[Type.flying] = List()
    notEffectiveMap[Type.poison] = List(Type.steel)
    notEffectiveMap[Type.ground] = List(Type.flying)
    notEffectiveMap[Type.rock] = List()
    notEffectiveMap[Type.bug] = List()
    notEffectiveMap[Type.ghost] = List(Type.normal)
    notEffectiveMap[Type.steel] = List()
    notEffectiveMap[Type.fire] = List()
    notEffectiveMap[Type.water] = List()
    notEffectiveMap[Type.grass] = List()
    notEffectiveMap[Type.electric] = List(Type.ground)
    notEffectiveMap[Type.psychic] = List(Type.dark)
    notEffectiveMap[Type.ice] = List()
    notEffectiveMap[Type.dragon] = List(Type.fairy)
    notEffectiveMap[Type.dark] = List()
    notEffectiveMap[Type.fairy] = List()

    return notEffectiveMap[self]:contains(another)
end
