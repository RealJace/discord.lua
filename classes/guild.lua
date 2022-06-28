local Object = require("discord.lua/classes/class")

local guild = Object:extend("Guild")

function guild:new(d)

    if not d then return end

    self.d = d

    self.api = require("discord.lua/libs/api").get()
    self.client = self.api.client
    self.id = self.d["guild_id"]

    if not self.id then return end

    local body = self.api:request("GET","guilds/" .. self.id)

    if not body then return end

    self.name = body.name
    self.icon = body.icon
    self.icon_hash = body.icon_hash
    self.splash = body.splash
    self.description = body.description
    self.banner = body.banner

    return self
end

return guild