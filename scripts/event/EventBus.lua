require('scripts.utils.class')
require('scripts.utils.list')

EventBus = class()
function EventBus:__init()
    self.handlers = {}
end

function EventBus:getHandlerList(eventName)
    self.handlers[eventName] = self.handlers[eventName] or List()
    return self.handlers[eventName]
end

function EventBus:subscribe(handler)
    local eventName = handler.eventName
    local handlerList = self:getHandlerList(eventName)
    handlerList:add(handler)
end

function EventBus:publish(event)
    local finished = List()
    local handlers = self:getHandlerList(event.name):copy()
    handlers:addAll(self:getHandlerList('__any'))
    handlers:foreach(function(e)
        local stat = e.onEvent(event)
        if stat == HandlerStats.finished then
            finished:add(e)
        end
    end)
    finished:foreach(function(e)
        self:unSubscribe(e)
    end)
end

function EventBus:unSubscribe(handler)
    local eventName = handler.eventName
    local handlerList = self:getHandlerList(eventName)
    handlerList:remove(handler)
end
