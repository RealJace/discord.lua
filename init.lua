-- Classes

local client = require("./libs/client")

-- Modules

local http = require("coro-http")

-- Main module

local discord = {}

function discord.Client()
    local Client = client:new()
    return Client
end

return discord