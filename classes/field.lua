local field = {}
field.__index = field

function field.new(name,value,inline)

    assert(name,"'name' parameter is required.")
    assert(value,"'value' parameter is required")

    local self = {}
    setmetatable(self,field)

    self.name = name
    self.value = value
    self.inline = inline or false

    return self
end

return field