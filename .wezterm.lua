-- Pull in the wezterm API
local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("Ubuntu Mono")
config.font_size = 19

return config
