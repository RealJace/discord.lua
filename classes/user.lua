local Object = require("discord.lua/classes/class")

local user = Object:extend()

function user:new(d)
    self.id = d["id"]
    self.bot = d["bot"]
    self.username = d["username"]
    self.discriminator = d["discriminator"]
    return self
end

return user