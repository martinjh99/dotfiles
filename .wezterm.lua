-- Pull in the wezterm API
local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.initial_cols = 100
config.initial_rows = 28
config.font = wezterm.font("Ubuntu Mono")
config.font_size = 18
return config
