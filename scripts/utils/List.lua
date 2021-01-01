require('scripts.utils.class')

List = class()
function List:__init(...)
    self._size = 0
    for _, v in ipairs({ ... }) do
        self:add(v)
    end
end

function List:size()
    return self._size
end

function List:isEmpty()
    return self:size() == 0
end

function List:isNotEmpty()
    return not self:isEmpty()
end

function List:indexOf(element)
    for i, v in ipairs(self) do
        if v == element then
            return i
        end
    end
end

function List:contains(element)
    return self:indexOf(element) ~= nil
end

function List:add(element)
    table.insert(self, element)
    self._size = self._size + 1
end

function List:insert(element, index)
    table.insert(self, element, index)
    self._size = self._size + 1
end

function List:remove(element)
    local index = self:indexOf(element)
    assert(index ~= nil)
    table.remove(self, element)
    self._size = self._size - 1
end

function List:containsAll(list)
    assert(instanceof(list, List))
    for _, v in ipairs(list) do
        if not self:contains(v) then
            return false
        end
    end
    return true
end

function List:addAll(list)
    assert(instanceof(list, List))
    for _, v in ipairs(list) do
        self:add(v)
    end
end

function List:removeAll(list)
    assert(instanceof(list, List))
    for _, v in ipairs(list) do
        self:remove(v)
    end
end

function List:retainAll(list)
    assert(instanceof(list, List))
    local res = List()
    for _, v in ipairs(list) do
        if self:contains(v) then
            res:add(v)
        end
    end
    return res
end

function List:deduction(func)
    local res = List()
    for _, v in ipairs(self) do
        local e = func(v)
        res:add(e)
    end
    return res
end

function List:copy()
    return self:deduction(function(e)
        return e
    end)
end

function List:sort(cmp)
    cmp = cmp or function(a, b)
        return a < b
    end
    for i = 1, self:size() - 1 do
        for j = 1, self:size() - i do
            local v = self[j]
            local w = self[j + 1]
            if cmp(w, v) then
                self[j] = w
                self[j + 1] = v
            end
        end
    end
end

function List:clear()
    while self._size > 0 do
        self:remove(self[1])
    end
end

function List:subList(from, to)
    from = from or 1
    to = to or self:size()
    local res = List()
    for i = from, to do
        res:add(self[i])
    end
end

function List:foreach(func)
    for _, v in ipairs(self) do
        func(v)
    end
end

function List:indices()
    local res = List()
    for i, _ in ipairs(self) do
        res:add(i)
    end
    return res
end

function List:filter(func)
    local res = List()
    for _, v in ipairs(self) do
        if func(v) then
            res:add(v)
        end
    end
    return res
end