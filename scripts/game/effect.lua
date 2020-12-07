require('scripts.class')

Effect = class()
function Effect:__init__(eventName, onEvent)
    self.eventName = eventName
    self.onEvent = onEvent
end
