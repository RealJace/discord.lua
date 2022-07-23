local websocket = require("coro-websocket")
local http = require("coro-http")
local time = require("timer")
local json = require("json")

local Message = require("discord.lua/classes/message")
local Interaction = require("discord.lua/classes/interaction")
local User = require("discord.lua/classes/user")

local color = require("discord.lua/libs/colors")

local Object = require("discord.lua/classes/class")

local wrap = coroutine.wrap

local api = Object:extend()

api.api = nil

function api:new(client,intents)

    if not intents then error("Intents are required") end

    self.client = client
    self.rest = "https://discord.com/api/v10"
    self.intents = intents
    api.api = self
end

function info(string,warn)
    if not warn then
        print(os.date("[%Y-%m-%d %H:%M:%S]") .. " - " .. color.green ..  "[DISCORD.LUA]" .. color.reset .. " " .. string)
    else
        print(os.date("[%Y-%m-%d %H:%M:%S]") .. " - " .. color.red ..  "[DISCORD.LUA]" .. color.reset .. " " .. string)
    end
end

function api:login(token)
    info("Connecting to gateway.discord.gg")

    local res,read,write = websocket.connect{
        host = "gateway.discord.gg",
        pathname = "/?v=10&encoding=json",
        tls = true,
        port = 443,
    }

    local intents = 0

    if not type(self.intents) == "number" then error("Intents need to be provided as number.") end

    intents = self.intents

    if not res then
        return info(read,true)
    else
        info("Connected to gateway.discord.gg")
    end

    local hello_payload = json.decode(read().payload)

    function send(pl)
        return write{
            opcode = 1,
            payload = json.encode(pl) --opcode = old_payload.op or 2,
        }
    end

    time.setInterval(hello_payload.d.heartbeat_interval,function()
        wrap(function()
            send({
                op = 11,
            })
        end)()
    end)

    wrap(function()
        local sucess,err = send({
            op = 2,
            d = {
                token = token,
                intents = intents,
                properties = {
                    os = "linux",
                    browser = "discord.lua",
                    device = "discord.lua"
                }
            }
        })
        if not sucess then
            info("Failed identifing: " .. err,true)
        else
            info("Identified")
        end
    end)()
    
    wrap(function ()
        for pl in read do
            local raw_event = pl.payload
            if raw_event then
                local event,err = json.decode(raw_event)
                if event then
                    if event.op == 2 then
                        info("Identified")
                        self.client:add_user(User(event.d))
                    end
                    if event.op == 0 then
                        local arg = nil
                        if event.t == "MESSAGE_CREATE" then
                            arg = Message(event.d)
                        end
                        if event.t == "INTERACTION_CREATE" then
                            arg = Interaction(event.d)
                        end
                        self.client:emit(event.t,arg)
                    end
                    if event.op == 10 then
                        info("Received HELLO")
                    end
                else
                    info(err,true)
                end
            end
        end
    end)()
    info("Heartbeating")
end

function api:request(method,endpoint,payload_body)

    local res,body = http.request(method,"https://discord.com/api/v10/" .. endpoint,{{"Authorization","Bot " .. self.client.token},{"Content-Type","application/json"}},json.encode(payload_body))
    
    if res.code ~= 200 then
        return info(res.reason,true)
    end
    return json.decode(body)
end

function api.get()
    return api.api
end

return api