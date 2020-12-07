require('scripts.class')

EventBus = class()
function EventBus:__init__()
    self.handlers = {}
end

function EventBus:getHandlerList(eventName)
    self.handlers[eventName] = self.handlers[eventName] or {}
    return self.handlers[eventName]
end

function EventBus:subscribe(handler)
    local eventName = handler.eventName
    local handlerList = self:getHandlerList(eventName)
    table.insert(handlerList, handler)
    table.sort(handlerList, function (a, b)
        return a.priority > b.priority
    end)
end

function EventBus:publish(event)
    local eventName = event.name
    local handlerList = self:getHandlerList(eventName)
    if handlerList ~= nil then
        local finished = {}
        for _, v in ipairs(handlerList) do
            local stat = v.onEvent(event)
            if stat == HandlerStats.finished then
                table.insert(finished, v)
            end
        end
        for _, v in ipairs(finished) do
            self:unSubscribe(v)
        end
    end
end

function EventBus:unSubscribe(handler)
    local eventName = handler.eventName
    local handlerList = self:getHandlerList(eventName)
    table.delete(handlerList, handler)
end
