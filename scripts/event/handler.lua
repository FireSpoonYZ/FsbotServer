require('scripts.utils.class')

Handler = class()
function Handler:__init(eventName, onEvent, priority)
    self.eventName = eventName
    self.onEvent = onEvent
    self.priority = priority or 0
end

HandlerStats = enum({'finished'})
