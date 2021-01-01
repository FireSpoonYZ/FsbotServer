require('scripts.utils.class')

PriAndSpd = class()
function PriAndSpd:__init(pokemonEntityInBattle, priority)
    self.pokemonEntityInBattle = pokemonEntityInBattle
    self.priority = priority
end

function PriAndSpd:__lt(another)
    local priA = self.priority
    local priB = another.priority
    local spdA = self.pokemonEntityInBattle.spd
    local spdB = another.pokemonEntityInBattle.spd
    if priA ~= priB then
        return priA > priB
    elseif spdA ~= spdB then
        return spdA > spdB
    else
        return math.random() > 0.5
    end
end