require('scripts.utils.class')
require('scripts.utils.table')
require('scripts.game.battle.PokemonEntityInBattle')

Displayer = class()
function Displayer:__init(stage)
    self.messageQueue = {}
    self.stage = stage
end

function Displayer:pushMessage(message)
    assert(type(message) == 'string')
    --table.insert(self.messageQueue, message)
    print(message)
end

function Displayer:display()
    --[[while table.isNotEmpty(self.messageQueue) do
        print(self.messageQueue[1])
        table.remove(self.messageQueue, 1)
    end]]
    self.stage:foreach(function(entities)
        entities:foreach(function(entity)
            print(entity.pokemonEntity.name .. " " .. entity.hp .. "/" .. entity.maxHp)
        end)
    end)
end
