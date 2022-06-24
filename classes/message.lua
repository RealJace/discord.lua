local http = require("coro-http")
local json = require("json")

local User = require("./user")
local Guild = require("./guild")

local message = {}

message.__index = message

function message.new(client,d)
    local self = {}
    setmetatable(self,message)
    self.content = d["content"]
    self.channel_id = d["channel_id"]
    self.id = d["id"]
    self.author = User.new(d["author"])
    self.guild = Guild.new(d)
    self._client = client
    return self
end

function send_message(content,channel_id,client,reply_message_id)
    if type(content) == "string" then
        local payload = {
            content = content,
            message_reference = {message_id = reply_message_id}
        }
        local res = http.request("POST","https://discord.com/api/v10/channels/" .. channel_id .. "/messages",{{"Authorization","Bot " .. client._token},{"Content-Type","application/json"}},json.encode(payload))
        if res.code ~= 200 then
            return print(res.reason)
        end
        --return message.new(client,json.decode(res))
    elseif type(content) == "table" then
        local payload = {
            content = content["content"] or "",
            embeds = content["embeds"] or {},
            message_reference = {message_id = reply_message_id}
        }
        local res = http.request("POST","https://discord.com/api/v10/channels/" .. channel_id .. "/messages",{{"Authorization","Bot " .. client._token},{"Content-Type","application/json"}},json.encode(payload))
        if res.code ~= 200 then
            return print(res.reason)
        end

        --return message.new(client,res)
    end
end

function message:reply(content)
    send_message(content,self.channel_id,self._client,message.id)
end

return message