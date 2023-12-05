-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Tomorrow Night'

config.font_size = 22.0
config.font = wezterm.font("mononoki Nerd Font", {weight="Regular", stretch="Normal", style="Normal"})
config.font = wezterm.font("mononoki Nerd Font", {weight="Regular", stretch="Normal", style="Italic"})
config.font = wezterm.font("mononoki Nerd Font", {weight="Bold", stretch="Normal", style="Normal"})
config.font = wezterm.font("mononoki Nerd Font", {weight="Bold", stretch="Normal", style="Italic"})

-- and finally, return the configuration to wezterm
return config
