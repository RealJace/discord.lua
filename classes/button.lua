local Object = require("discord.lua/classes/class")

local button = Object:extend()

function button:init()
    self.type = 2
end

function button:set_label(label)
    self.label = label
end

function button:set_style(style)
    self.style = style
end

function button:set_custom_id(custom_id)
    self.custom_id = custom_id
end

function button:set_url(url)
    self.url = url
end

function button:set_disabled(disabled)
    self.disabled = disabled
end

return button