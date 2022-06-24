local http = require("coro-http")
local json = require("json")

local message = {}

message.__index = message

function message.new(client,d)
    local self = {}
    setmetatable(self,message)
    self.content = d["content"]
    self.channel_id = d["channel_id"]
    self._client = client
    return self
end

function message:reply(content)
    local payload = {
        content = content
    }
    local res = http.request("POST","https://discord.com/api/v10/channels/" .. self.channel_id .. "/messages",{{"Authorization","Bot " .. self._client._token}},json.encode(payload))
    if res.code ~= 200 then
        print(res.reason); return
    end
end

return message