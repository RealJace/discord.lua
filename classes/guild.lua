local guild = {}
guild.__index = guild

function guild.new(d)
    local self = {}

    setmetatable(self,guild)

    self.id = d["guild_id"]

    return self
end

return guild