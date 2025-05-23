local wezterm = require 'wezterm'

-- Load the main config
local config = dofile(wezterm.config_dir .. '/wezterm.lua')

config = {
  window_class = "btop",
  default_prog = { "btop" },
}

return config
