local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

term = "wezterm"

-- General 
config.font = wezterm.font("CaskaydiaCove Nerd Font Mono")
--config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 12
config.line_height = 1.2
config.color_scheme = "Catppuccin Mocha"
--config.color_scheme = "tokyonight_night"
--config.color_scheme = 'iceberg-dark'
--config.color_scheme = 'Builtin Dark'
--config.color_scheme = 'Dark Violet'
--config.color_scheme = 'IR_Black'
--config.color_scheme = "Night"

config.window_decorations = "RESIZE"

config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

--config.colors = {
--  cursor_bg = "#CBA6F7",
--  cursor_border = "#CBA6F7"
--}

-- Key bindings
config.keys = {
  { key = 'q', mods = 'CTRL', action = wezterm.action.CloseCurrentPane { confirm = true }, },
  { key = 'Enter', mods = 'CTRL|SHIFT', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }, },
  { key = 'Enter', mods = 'CTRL|ALT', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
  -- Swap panes
  { key = 'r', mods = 'CTRL|SHIFT', action = act.PaneSelect { mode = 'SwapWithActive' } },  
  -- Rotate panes (this actually reorders them)
  { key = 's', mods = 'CTRL|SHIFT', action = wezterm.action.RotatePanes 'CounterClockwise', },
  { key = 'S', mods = 'CTRL|SHIFT', action = wezterm.action.RotatePanes 'Clockwise', },

  { key = '1', mods = 'ALT', action = act.ActivateTab(0) },
  { key = '2', mods = 'ALT', action = act.ActivateTab(1) },
  { key = '3', mods = 'ALT', action = act.ActivateTab(2) },
  { key = '4', mods = 'ALT', action = act.ActivateTab(3) },
  { key = '5', mods = 'ALT', action = act.ActivateTab(4) },
  { key = '6', mods = 'ALT', action = act.ActivateTab(5) },
  { key = '7', mods = 'ALT', action = act.ActivateTab(6) },
  { key = '8', mods = 'ALT', action = act.ActivateTab(7) },
  { key = '9', mods = 'ALT', action = act.ActivateTab(8) },
}

return config
