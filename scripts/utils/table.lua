--[[
function table.deepCopy(list)
    assert(type(list) == 'table')

    local res = {}
    for k, v in pairs(list) do
        if type(v) == 'table' then
            res[k] = table.clone(v)
        else
            res[k] = v
        end
    end
    setmetatable(res, getmetatable(list))

    return res
end
function table.copy(list)
    assert(type(list) == 'table')

    local res = {}
    for k, v in pairs(list) do
        res[k] = v
    end
    setmetatable(res, getmetatable(list))

    return res
end

function table.index(list, element)
    for i, v in ipairs(list) do
        if v == element then
            return i
        end
    end
    return -1
end

function table.contains(list, element)
    return table.index(list, element) ~= -1
end

function table.delete(list, element)
    local index = table.index(list, element)
    assert(index ~= -1)
    table.remove(list, index)
end
]]