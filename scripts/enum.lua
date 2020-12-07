require('scripts.class')

function enum(...)
    local res = class()

    local counter = 0
    for _, v in pairs({...}) do
        counter = counter + 1

        local inst = res()
        inst.__name__ = v
        inst.__uid__ = counter

        res[v] = inst
    end

    return res
end