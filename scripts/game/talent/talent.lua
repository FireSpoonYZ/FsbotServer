require('scripts.class')
require('scripts.game.effect')

Talent = class()
function Talent:__init__(name)
    self.name = name
    self.effects = {}
end

function Talent:addEffect(eventName, onEvent)
    local effect = Effect(eventName, onEvent)
    table.insert(self.effects, effect)
end
