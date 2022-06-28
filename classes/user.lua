local Object = require("discord.lua/classes/class")

local user = Object:extend()

function user:init(d)

    if not d then return end

    self.d = d

    self.id = self.d["id"]
    self.bot = self.d["bot"]
    self.username = self.d["username"]
    self.discriminator = self.d["discriminator"]
end

return user