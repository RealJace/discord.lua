local api = require("./api")

local client = require("core").Emitter:extend()

function client:initialize(intents)
    self.api = api(self,intents)
end

function client:login(token)
    self.token = token
    self.api:login(self.token)
end

function client:add_user(user)
    self.user = user
end

return client