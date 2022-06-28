
local Object = require("discord.lua/classes/class")

local Guild = require("discord.lua/classes/guild")

local Message = require("discord.lua/classes/message")

local Channel = require("discord.lua/classes/channel")

local interaction = Object:extend()

function interaction:init(d)

    if not d then return end

    print("nice")

    self.d = d

    self.api = require("discord.lua/libs/api").get()
    self.client = self.api.client
    
    self.custom_id = self.d["data"]["custom_id"]
    self.id = self.d["id"]
    self.token = self.d["token"]
    self.guild = Guild(self.d)
    self.channel = Channel(self.d)
    self.message = Message(self.d["message"])
end

function interaction:reply(content)
    local payload = {}
    payload.type = 4
    payload.data = {}

    if type(content) == "string" then
        payload.data.content = content
    elseif type(content) == "table" then
        payload.data = content
    end

    local body = self.api:request("POST","interactions/" .. self.id .. "/" .. self.token .. "/callback",payload)
end

function interaction:defer()
    local payload = {}
    payload.type = 5
    payload.data = {}

    local body = self.api:request("POST","interactions/" .. self.id .. "/" .. self.token .. "/callback",payload)
end

function interaction:defer_edit()
    local payload = {}
    payload.type = 6
    payload.data = {}

    local body = self.api:request("POST","interactions/" .. self.id .. "/" .. self.token .. "/callback",payload)
end

return interaction