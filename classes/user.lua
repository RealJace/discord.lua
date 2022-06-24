local user = {}
user.__index = user

function user.new(d)
    local self = {}
    setmetatable(self,user)
    self.id = d["id"]
    self.bot = d["bot"]
    self.username = d["username"]
    self.discriminator = d["discriminator"]
    return self
end

return user