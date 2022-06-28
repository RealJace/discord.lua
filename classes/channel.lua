local Object = require("discord.lua/classes/class")
local Guild = require("discord.lua/classes/guild")
local Message = require("discord.lua/classes/message")

local channel = Object:extend("Channel")

function channel:new(d)

    if not d then return end

    self.d = d

    self.id = d["channel_id"]
    self.guild = Guild(self.d)
    self.api = require("discord.lua/libs/api").get()
    self.client = self.api.client

    return self
end

function channel:send(content)
    local payload = {}

    if type(content) == "string" then
        payload.content = content
    elseif type(content) == "table" then
        payload = content
    end

    local body = self.api:request("POST","channels/" .. self.channel.id .. "/messages",payload)

    return Message(self.client,body)
end

return channel