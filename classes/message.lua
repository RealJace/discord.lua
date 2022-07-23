
local User = require("discord.lua/classes/user")
local Guild = require("discord.lua/classes/guild")
local Channel = require("discord.lua/classes/channel")
local Object = require("discord.lua/classes/class")
local Interaction = require("discord.lua/classes/interaction")

local message = Object:extend()

function message:new(d)

    if not d then return end
    self.d = d

    self.api = require("discord.lua/libs/api").get()
    self.client = self.api.client
    
    self.content = self.d["content"]
    self.id = self.d["id"]
    self.author = User(self.d["author"])
    self.guild = Guild(self.d)
    self.channel = Channel(self.d)
    self.mention_everyone = self.d["mention_everyone"]
    self.mentions = {}

    if self.d["mentions"] then
        for i,user in ipairs(self.d["mentions"]) do
            table.insert(self.mentions,i,User(user))
        end
    end

    self.pinned = self.d["pinned"]
    self.type = self.d["type"]
    if self.d["interaction"] then
        self.interaction = Interaction(self.d["interaction"])
    end
end

function message:reply(content)
    local payload = {}

    if type(content) == "string" then
        payload.content = content
    elseif type(content) == "table" then
        payload = content
    end

    payload.message_reference = {
        message_id = self.id
    }

    if not self.channel.id then return end

    p(payload)

    local body = self.api:request("POST","channels/" .. self.channel.id .. "/messages",payload)

    return message(self.client,body)
end

function message:edit(content)
    local payload = {}

    if type(content) == "string" then
        payload.content = content
    elseif type(content) == "table" then
        payload = content
    end

    if not self.channel.id then return end

    local body = self.api:request("PATCH","channels/" .. self.channel.id .. "/messages/" .. self.id,payload)
end

return message