-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'Google Dark (Gogh)'
-- config.color_scheme = 'GJM (terminal.sexy)'
config.color_scheme = 'Gnometerm (terminal.sexy)'
config.font = wezterm.font('JetBrains Mono')
config.font_size = 12.0

-- split
config.keys = {
  -- This will create a new split and run your default program inside it
  {
    key = '"',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
}

-- and finally, return the configuration to wezterm
return config
