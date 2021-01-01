require('scripts.utils.class')
require('scripts.utils.List')

Skill = class()

function Skill:__init(name, priority)
    self.name = name
    self.priority = priority or 0
    self.components = List()
end

function Skill:addComponent(component)
    self.components:add(component)
end
