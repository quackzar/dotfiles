local wezterm = require 'wezterm';
return {
    term = 'wezterm',
    custom_block_glyphs = true,
    tab_bar_at_bottom = true,
    hide_tab_bar_if_only_one_tab = true,
    -- window_decorations = "RESIZE",
    default_prog = {'/opt/homebrew/bin/fish', '-l'},
    font_size = 13,
    font = wezterm.font_with_fallback({
        -- "FiraCode Nerd Font",
        "JetBrainsMono Nerd Font",
        -- "JetBrains Mono",
        -- "DejaVuSansM Nerd Font",
        -- "VictorMono Nerd Font Mono",

        -- Nonicons, special cool symbols
        {family="nonicons", scale=1.0},
        -- Codicon (vs-code specific)
        {family = "codicon", scale = 0.8},
        -- Terminal Blocks
        {family = "LegacyComputing", scale=1.1},
    }),
    harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
    default_cursor_style = 'SteadyBar',
    color_scheme = "Kanagawa (Gogh)",
    enable_csi_u_key_encoding = true,

    inactive_pane_hsb = {
        saturation = 0.9,
        brightness = 0.8,
    },
}
