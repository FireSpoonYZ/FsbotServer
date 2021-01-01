require('scripts.utils.class')

Event = class()
function Event:__init(name, extra)
    self.name = name
    self.extra = extra or {}
end

function Event:__index(key)
    return self.extra[key]
end
