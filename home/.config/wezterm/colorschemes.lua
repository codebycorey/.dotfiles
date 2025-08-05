local wezterm = require("wezterm")

local M = {
    themes = {
        catppuccin = "Catppuccin Mocha",
        kanagawa = "Kanagawa (Gogh)",
    },
    color_schemes = {},
}

-- Override background color for all themes
local custom_background = "#1e1e1e"

for _, theme_id in pairs(M.themes) do
    local colors = wezterm.color.get_builtin_schemes()[theme_id]
    if colors then
        -- Create a new table to avoid modifying the original
        local modified_colors = {}
        for k, v in pairs(colors) do
            modified_colors[k] = v
        end
        modified_colors.background = custom_background
        M.color_schemes[theme_id] = modified_colors
    end
end

-- Set the active theme
M.active_theme = M.themes.catppuccin

return M
