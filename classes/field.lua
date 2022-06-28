local Object = require("discord.lua/classes/class")
local field = Object:extend()

function field:init(name,value,inline)

    assert(name,"'name' parameter is required.")
    assert(value,"'value' parameter is required")

    self.name = name
    self.value = value
    self.inline = inline or false
end

return field