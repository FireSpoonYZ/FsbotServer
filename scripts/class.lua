require('scripts.utils')

Object = {}
function initClass(class, superClass)
    if class ~= Object then
        if superClass ~= nil then
            class.__super__ = superClass
        else
            class.__super__ = Object
        end
    end

    setmetatable(class, {
        --构造函数
        __call = function(_, ...)
            local inst = {}
            inst.__class__ = class
            setmetatable(inst, {
                __index = function(_inst, key)
                    if key == 'super' then
                        return function(this, thisClass, ...)
                            local superInit = thisClass.__super__.__init__
                            superInit(this, ...)
                        end
                    end
                    local c = _inst.__class__
                    while c ~= nil do
                        local value = c[key]
                        if value ~= nil then
                            return value
                        end
                        c = c.__super__
                    end
                end
            })
            local init = inst.__class__.__init__
            if init ~= nil then
                init(inst, ...)
            end

            return inst
        end
    })
end
initClass(Object)

function class(superClass)
    local Class = {}
    initClass(Class, superClass)
    return Class
end

function isObject(inst)
    return type(inst) == 'table' and type(inst.__class__) == 'table'
end

function instanceof(inst, class)
    if isObject(inst) then
        local c = inst.__class__
        while c ~= nil do
            if c == class then
                return true
            end
            c = c.__super__
        end
    end
    return false
end

function Object:clone()
    local res = {}
    for k, v in pairs(self) do
        if k == '__class__' then
            res[k] = v
        elseif type(v) == 'table' then
            res[k] = table.clone(v)
        else
            res[k] = v
        end
    end
    return res
end
