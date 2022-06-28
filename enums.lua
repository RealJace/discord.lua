return {
    BUTTON_STYLE = {
        PRIMARY = 1,
        SECONDARY = 2,
        SUCCESS = 3,
        DANGER = 4,
        LINK = 5
    },
    INTERACTION_TYPE = {
        PING = 1,
        APPLICATION_COMMAND = 2,
        MESSAGE_COMPONENT = 3,
        APPLICATION_COMMAND_AUTOCOMPLETE = 4,
        MODAL_SUBMIT = 5
    },
    INTENTS = {
        GUILDS = bit.lshift(1,0),
        GUILD_MEMBERS = bit.lshift(1,1),
        GUILD_BANS = bit.lshift(1,2),
        GUILD_EMOJIS_AND_STICKERS = bit.lshift(1,3),
        GUILD_INTEGRATIONS = bit.lshift(1,4),
        GUILD_WEBHOOKS = bit.lshift(1,5),
        GUILD_INVITES = bit.lshift(1,6),
        GUILD_VOICE_STATES = bit.lshift(1,7),
        GUILD_PRESENCES = bit.lshift(1,8),
        GUILD_MESSAGES = bit.lshift(1,9),
        GUILD_MESSAGE_REACTIONS = bit.lshift(1,10),
        GUILD_MESSAGE_TYPING = bit.lshift(1,11),
        DIRECT_MESSAGES = bit.lshift(1,12),
        DIRECT_MESSAGE_REACTIONS = bit.lshift(1,13),
        DIRECT_MESSAGE_TYPING = bit.lshift(1,14),
        MESSAGE_CONTENT = bit.lshift(1,15),
        GUILD_SCHEDULED_EVENTS = bit.lshift(1,16),
    }
}