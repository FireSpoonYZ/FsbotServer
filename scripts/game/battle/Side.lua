require('scripts.utils.class')
require('scripts.utils.List')
require('scripts.game.PokemonEntity')
require('scripts.game.battle.PokemonEntityInBattle')

Side = class()
function Side:__init(battleContext, entities, groundIndies)
    self.ground = List()
    self.reserve = List()
    self.entities = entities:indices():deduction(
            function(i)
                local e = entities[i]
                local inst = PokemonEntityInBattle(battleContext, e)
                if groundIndies:contains(i) then
                    self.ground:add(inst)
                else
                    self.reserve:add(inst)
                end
                return inst
            end
    )
end
