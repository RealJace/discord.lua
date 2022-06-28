local Object = require("discord.lua/classes/class")

local action_row = Object:extend()

function action_row:init()
    self.type = 1
    self.components = {}
end

function action_row:add_component(component)
    table.insert(self.components,component)
end

return action_row