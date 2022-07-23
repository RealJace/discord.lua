local Object = require("discord.lua/classes/class")

local embed = Object:extend()

embed.Field = require("discord.lua/classes/field")
embed.Image = require("discord.lua/classes/embed_image")

function embed:new()
    self.fields = {}
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