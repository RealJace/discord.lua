-- Classes

local client = require("./libs/client")
local embed = require("./classes/embed")

-- Modules

local http = require("coro-http")

-- Main module

local discord = {}

discord.Embed = embed

function discord.Client()
    local Client = client:new()
    return Client
end

return discord