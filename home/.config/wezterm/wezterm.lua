local wezterm = require("wezterm")
local colors = require("colorschemes")

local config = wezterm.config_builder()

-- Terminal configuration
config.term = "tmux-256color"

-- Font configuration
config.font = wezterm.font("IosevkaTerm Nerd Font")
config.font_size = 15.0
config.line_height = 1.2
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" } -- Disable ligatures

-- Window appearance
config.window_decorations = "RESIZE"
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- Apply color scheme
config.color_schemes = colors.color_schemes
config.color_scheme = colors.active_theme

print("Active color scheme:", colors.active_theme)
print("Available color schemes:", colors.color_schemes[colors.active_theme])

return config
