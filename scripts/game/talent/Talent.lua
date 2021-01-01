require('scripts.utils.class')
require('scripts.utils.List')
require('scripts.game.Effect')

Talent = class()
function Talent:__init(name)
    self.name = name
    self.effects = List()
end

function Talent:addEffect(effect)
    self.effects:add(effect)
end
