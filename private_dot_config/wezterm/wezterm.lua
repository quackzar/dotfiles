local wezterm = require 'wezterm';

wezterm.on('user-var-changed', function(window, pane, name, value)
    local overrides = window:get_config_overrides() or {}
    if name == "ZEN_MODE" then
        local incremental = value:find("+")
        local number_value = tonumber(value)
        if incremental ~= nil then
            while (number_value > 0) do
                window:perform_action(wezterm.action.IncreaseFontSize, pane)
                number_value = number_value - 1
            end
            overrides.enable_tab_bar = false
        elseif number_value < 0 then
            window:perform_action(wezterm.action.ResetFontSize, pane)
            overrides.font_size = nil
            overrides.enable_tab_bar = true
        else
            overrides.font_size = number_value
            overrides.enable_tab_bar = false
        end
    end
    window:set_config_overrides(overrides)
end)

return {
    max_fps = 120,
    term = 'wezterm',
    custom_block_glyphs = true,
    tab_bar_at_bottom = true,
    hide_tab_bar_if_only_one_tab = true,
    -- window_decorations = "RESIZE",
    default_prog = {'/opt/homebrew/bin/fish', '-l'},
    font_size = 14,
    font = wezterm.font_with_fallback({
        -- "FiraCode Nerd Font",
        {family="Monaspace Neon", harfbuzz_features = { 'ss02=1', 'ss07=1', 'ss04=1', 'ss03=1', 'ss06=1'}},
        -- {family="Intel One Mono"},
        -- {family="JetBrainsMono Nerd Font"},
        -- "JetBrains Mono",
        "DejaVuSansM Nerd Font",
        -- "VictorMono Nerd Font Mono",

        -- Nonicons, special cool symbols
        {family="nonicons", scale=1.0},
        -- Codicon (vs-code specific)
        {family = "codicon", scale = 0.8},
        -- Terminal Blocks
        {family = "LegacyComputing", scale=1.1},
    }),
    harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1', 'dist=1' },
    default_cursor_style = 'SteadyBar',
    color_scheme = "Kanagawa (Gogh)",
    enable_csi_u_key_encoding = true,


    inactive_pane_hsb = {
        saturation = 0.9,
        brightness = 0.8,
    },
}
