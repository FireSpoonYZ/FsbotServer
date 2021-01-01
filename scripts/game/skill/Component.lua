require('scripts.utils.class')

Component = class()
function Component:__init(exec)
    self.exec = exec
end

function Component:execute(context)
    self.exec(context)
end
