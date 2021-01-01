require('scripts.utils.class')
require('scripts.utils.List')

function enum(table)
    assert(type(table) == 'table')

    local res = class()
    res.__values = {}

    function res:__init(key, name)
        assert(type(key) == 'string')
        assert(type(name) == 'string')

        assert(res.__values[key] == nil)
        assert(res:valueOf(name) == nil)

        self.__name__ = name

        res.__values[key] = self
    end

    function res:values()
        return self.__values
    end

    function res:valueOf(name)
        for _, v in pairs(self.__values) do
            if v.__name__ == name then
                return v
            end
        end
    end

    for k, v in pairs(table) do
        assert(type(v) == 'string')
        if type(k) == 'string' then
            res(k, v)
        else
            assert(type(k) == 'number')
            res(v, v)
        end
    end

    local mt = getmetatable(res)
    mt.__index = function(this, key)
        return this:values()[key]
    end

    return res
end