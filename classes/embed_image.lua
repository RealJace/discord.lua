local embed_image = {}
embed_image.__index = embed_image

function embed_image.new()
    local self = {}
    setmetatable(self,embed_image)

    self.url = ""

    return self
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