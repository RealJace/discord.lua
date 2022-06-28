-- Classes

local client = require("./libs/client")
local embed = require("discord.lua/classes/embed")
local action_row = require("discord.lua/classes/action_row")
local button = require("discord.lua/classes/button")

-- Modules

local http = require("coro-http")

-- Main module

local discord = {}

discord.Embed = embed
discord.ActionRow = action_row
discord.Button = button
discord.enums = require("./enums")


function discord.Client(intents)
    local Client = client:new(intents)
    return Client
end

return discord