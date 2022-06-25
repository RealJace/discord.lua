local api = require("./api")

local client = require("core").Emitter:extend()

function client:initialize()
    self.api = api(self)
end

function client:login(token)
    self._token = token
    self.api:login(token)
end

return client