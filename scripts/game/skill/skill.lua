require('scripts.class')

Skill = class()

function Skill:__init__(name, priority)
    self.name = name
    self.priority = priority or 0
    self.components = {}
end

function Skill:addComponent(component)
    table.insert(self.components, component)
end
