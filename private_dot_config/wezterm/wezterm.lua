local wezterm = require 'wezterm';
return {
    custom_block_glyphs = true,
    default_prog = {'/opt/homebrew/bin/fish', '-l'},
    font = wezterm.font_with_fallback({
        -- "DejaVuSansMono Nerd Font",
        "JetBrainsMono Nerd Font",
        "Iosevka",
        "nonicons",
        "codicon",
    }),
    harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
    default_cursor_style = 'SteadyBar',
    color_scheme = "Mashup Colors (terminal.sexy)",
    enable_csi_u_key_encoding = true,
    inactive_pane_hsb = {
        saturation = 0.9,
        brightness = 0.8,
    },
}
