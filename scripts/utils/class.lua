require('scripts.utils.table')

Object = {}
function initClass(class, superClass)
    if class ~= Object then
        if superClass ~= nil then
            class.__super = superClass
        else
            class.__super = Object
        end
    end

    class.__init = function()
    end

    setmetatable(class, {
        --构造函数
        __call = function(_, ...)
            local inst = {}
            inst.__class = class
            local mt = {}
            setmetatable(inst, mt)

            function get(this, key)
                local value = rawget(this, key)
                if value ~= nil then
                    return value
                end
                local c = this.__class
                while c ~= nil do
                    value = c[key]
                    if value ~= nil then
                        return value
                    end
                    c = c.__super
                end
            end

            mt.__index = function(this, key)
                local value = get(this, key)
                if value == nil then
                    local index = get(this, '__index')
                    if index ~= nil then
                        value = index(this, key)
                    end
                end
                return value
            end

            mt.__newindex = function(this, key, value)
                local func = get(this, __newindex)
                if func ~= nil then
                    func(this, key, value)
                else
                    rawset(this, key, value)
                end
            end

            mt.__add = function(this, another)
                local func = get(this, __add)
                if func ~= nil then
                    return func(this, another)
                end
            end

            mt.__sub = function(this, another)
                local func = get(this, __sub)
                if func ~= nil then
                    return func(this, another)
                end
            end

            mt.__mul = function(this, another)
                local func = get(this, __mul)
                if func ~= nil then
                    return func(this, another)
                end
            end

            mt.__div = function(this, another)
                local func = get(this, __div)
                if func ~= nil then
                    return func(this, another)
                end
            end

            mt.__mod = function(this, another)
                local func = get(this, __mod)
                if func ~= nil then
                    return func(this, another)
                end
            end

            mt.__unm = function(this, another)
                local func = get(this, __unm)
                if func ~= nil then
                    return func(this, another)
                end
            end

            mt.__concat = function(this, another)
                local func = get(this, __concat)
                if func ~= nil then
                    return func(this, another)
                end
            end

            mt.__eq = function(this, another)
                local func = get(this, __eq)
                if func ~= nil then
                    return func(this, another)
                end
                return this == another
            end

            mt.__lt = function(this, another)
                local func = get(this, __lt)
                if func ~= nil then
                    return func(this, another)
                end
            end

            mt.__le = function(this, another)
                local func = get(this, __le)
                if func ~= nil then
                    return func(this, another)
                end
            end

            mt.__call = function(this, another)
                local func = get(this, __call)
                if func ~= nil then
                    return func(this, another)
                end
            end

            inst:__init(...)

            return inst
        end
    })
end
initClass(Object)

function class(superClass)
    local class = {}
    initClass(class, superClass)
    return class
end

function super(this, thisClass, ...)
    assert(instanceof(this, thisClass))

    thisClass.__super.__init(this, ...)
end

function isObject(inst)
    return type(inst) == 'table' and type(inst.__class) == 'table'
end

function instanceof(inst, class)
    if isObject(inst) then
        local c = inst.__class
        while c ~= nil do
            if c == class then
                return true
            end
            c = c.__super
        end
    end
    return false
end

function Object:deepCopy()
    local res = {}
    for k, v in pairs(self) do
        if k == '__class' then
            res[k] = v
        elseif type(v) == 'table' then
            res[k] = table.deepCopy(v)
        else
            res[k] = v
        end
    end
    return res
end

function Object:copy()
    return table.copy(self)
end
