local wezterm = require 'wezterm';
local appearance = require 'appearance'

-- Cool tricks. https://alexplescan.com/posts/2024/08/10/wezterm/

-- 'Mono Amber (Gogh)' is neat.

local function colorscheme()
  if appearance.is_dark() then
    return 'Kanagawa (Gogh)'
  else
    return 'Selenized Light (Gogh)'
  end
end


wezterm.on('update-status', function(window)
  -- Grab the utf8 character for the "powerline" left facing
  -- solid arrow.
  local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

  -- Grab the current window's configuration, and from it the
  -- palette (this is the combination of your chosen colour scheme
  -- including any overrides).
  local color_scheme = window:effective_config().resolved_palette
  local bg = color_scheme.background
  local fg = color_scheme.foreground

  window:set_right_status(wezterm.format({
    -- First, we draw the arrow...
    { Background = { Color = 'none' } },
    { Foreground = { Color = bg } },
    { Text = SOLID_LEFT_ARROW },
    -- Then we draw our text
    { Background = { Color = bg } },
    { Foreground = { Color = fg } },
    { Text = ' ' .. wezterm.hostname() .. ' ' },
  }))
end)

local function move_pane(key, direction)
  return {
    key = key,
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection(direction),
  }
end

local function resize_pane(key, direction)
  return {
    key = key,
    action = wezterm.action.AdjustPaneSize { direction, 3 }
  }
end


return {
    max_fps = 120,
    term = 'wezterm',
    custom_block_glyphs = true,
    tab_bar_at_bottom = false,
    hide_tab_bar_if_only_one_tab = true,
    window_decorations = "RESIZE",
    default_prog = { '/opt/homebrew/bin/fish', '-l' },
    font_size = 14,
    font = wezterm.font_with_fallback({
        -- "FiraCode Nerd Font",
        { family = "Monaspace Neon",  harfbuzz_features = { 'ss02=1', 'ss07=1', 'ss04=1', 'ss03=1', 'ss06=1' } },
        -- {family="Intel One Mono"},
        -- {family="JetBrainsMono Nerd Font"},
        -- "JetBrains Mono",
        "DejaVuSansM Nerd Font",
        -- "VictorMono Nerd Font Mono",

        -- Nonicons, special cool symbols
        { family = "nonicons",        scale = 1.0 },
        -- Codicon (vs-code specific)
        { family = "codicon",         scale = 0.8 },
        -- Terminal Blocks
        { family = "LegacyComputing", scale = 1.1 },
    }),
    harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1', 'dist=1' },
    default_cursor_style = 'SteadyBar',
    color_scheme = colorscheme(),
    enable_csi_u_key_encoding = true,


    inactive_pane_hsb = {
        saturation = 0.9,
        brightness = 0.8,
    },

    leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1001 },

    keys = {
        {
            key = ',',
            mods = 'SUPER',
            action = wezterm.action.SpawnCommandInNewTab {
                cwd = wezterm.home_dir,
                args = { 'nvim', wezterm.config_file },
            },
        },
        {
            -- When we push LEADER + R...
            key = 'r',
            mods = 'LEADER',
            -- Activate the `resize_panes` keytable
            action = wezterm.action.ActivateKeyTable {
                name = 'resize_panes',
                -- Ensures the keytable stays active after it handles its
                -- first keypress.
                one_shot = false,
                -- Deactivate the keytable after a timeout.
                timeout_milliseconds = 1000,
            }
        },
        {
            -- I'm used to tmux bindings, so am using the quotes (") key to
            -- split horizontally, and the percent (%) key to split vertically.
            key = '"',
            -- Note that instead of a key modifier mapped to a key on your keyboard
            -- like CTRL or ALT, we can use the LEADER modifier instead.
            -- This means that this binding will be invoked when you press the leader
            -- (CTRL + A), quickly followed by quotes (").
            mods = 'LEADER',
            action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
        },
        {
            key = '%',
            mods = 'LEADER',
            action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
        },
        move_pane('j', 'Down'),
        move_pane('k', 'Up'),
        move_pane('h', 'Left'),
        move_pane('l', 'Right'),
    },
    key_tables = {
        resize_panes = {
            resize_pane('j', 'Down'),
            resize_pane('k', 'Up'),
            resize_pane('h', 'Left'),
            resize_pane('l', 'Right'),
        },
    }
}
