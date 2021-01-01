require('scripts.utils.class')

Effect = class()
function Effect:__init(eventName, onEvent, priority)
    self.eventName = eventName
    self.onEvent = onEvent
    self.priority = priority or 0
end
