local wezterm = require 'wezterm';
return {
    default_prog = {'/usr/local/bin/fish', '-l'},
    font = wezterm.font_with_fallback({
        "JetBrains Mono",
        "Symbols Nerd Font"
    }),
    harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
    color_scheme = "Banana Blueberry",
    enable_csi_u_key_encoding = true,
    inactive_pane_hsb = {
        saturation = 0.9,
        brightness = 0.8,
    },
}
