local Object = require("discord.lua/classes/class")

local guild = Object:extend()

function guild:new(d)
    self.id = d["guild_id"]

    return self
end

return guild