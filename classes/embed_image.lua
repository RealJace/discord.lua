local Object = require("discord.lua/classes/class")

local embed_image = Object:extend()

function embed_image:init()
    self.url = ""
end

function embed_image:set_url(url)
    self.url = url
end
function embed_image:set_proxy_url(proxy_url)
    self.proxy_url = proxy_url
end
function embed_image:set_width(width)
    self.width = width
end
function embed_image:set_height(height)
    self.height = height
end

return embed_image