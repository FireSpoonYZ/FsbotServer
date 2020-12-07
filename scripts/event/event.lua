require('scripts.class')

Event = class()
function Event:__init__(name, extra)
    assert(type(name) == 'string')
    assert(type(extra) == 'table')

    self.name = name
    for k, v in pairs(extra) do
        self[k] = v
    end
end
