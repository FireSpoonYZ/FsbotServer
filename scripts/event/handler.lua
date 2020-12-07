require('scripts.class')

Handler = class()
function Handler:__init__(eventName, onEvent, priority)
    self.eventName = eventName
    self.onEvent = onEvent
    self.priority = priority or 0
end

HandlerStats = enum('finished')
