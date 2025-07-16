local wezterm = require("wezterm")

local M = {
    themes = {
        catppuccin = "catppuccin-mocha",
        kanagawa = "Kanagawa (Gogh)",
    },
    color_schemes = {},
}

-- Override background color for all themes
-- local custom_background = "#202020"
local custom_background = "#202020"

for name, theme_id in pairs(M.themes) do
    local colors = wezterm.color.get_builtin_schemes()[theme_id]
    print(colors)
    if colors then
        -- Create a new table to avoid modifying the original
        local modified_colors = {}
        for k, v in pairs(colors) do
            modified_colors[k] = v
        end
        modified_colors.background = custom_background
        M.color_schemes[name] = modified_colors
    end
end

print("colorschemes.kanagawa", M.color_schemes.kanagawa)

-- Set the active theme
M.active_theme = M.themes.kanagawa

return M
