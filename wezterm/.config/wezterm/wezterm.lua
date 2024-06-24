local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- Set the TERM environment variable
config.term = "tmux-256color"

-- config.font = wezterm.font("GeistMono Nerd Font Mono")
config.font = wezterm.font("IosevkaTerm Nerd Font")
config.font_size = 15.0
config.line_height = 1.2

local catppuccin_mocha = "catppuccin-mocha"
local catppuccin_colors = wezterm.color.get_builtin_schemes()[catppuccin_mocha]
catppuccin_colors.background = "#202020"
config.color_schemes = {
    [catppuccin_mocha] = catppuccin_colors,
}
config.color_scheme = catppuccin_mocha
-- mocha = {
--     base = "#202020",
--     mantle = "#262626",
--     crust = "#181616",
-- },

config.window_decorations = "RESIZE"
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

return config
