local embed = {}
embed.__index = embed

embed.Field = require("./field")
embed.Image = require("./embed_image")

function embed.new()
    local self = {}
    setmetatable(self,embed)

    self.fields = {}

    return self
end

function embed:set_title(title)
    self.title = title
end
function embed:set_description(description)
    self.description = description
end
function embed:set_url(url)
    self.url = url
end
function embed:set_color(color)
    self.color = color
end
function embed:set_description(description)
    self.description = description
end
function embed:set_timestamp(timestamp)
    self.timestamp = timestamp
end
function embed:set_image(image)
    self.image = image
end
function embed:set_thumbnail(image)
    self.thumbnail = image
end
function embed:add_field(field)
    table.insert(self.fields,field)
end

return embed