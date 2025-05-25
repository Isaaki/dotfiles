local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

------------
-- CONFIG --
------------

config.skip_close_confirmation_for_processes_named = {
  'bash',
  'sh',
  'zsh',
  'fish',
  'tmux',
  'nu',
  'cmd.exe',
  'pwsh.exe',
  'powershell.exe',
  'btop',
  'nmtui',
  'bluetui',
  'lf',
  'chezmoi'
}

----------------
-- APPEARANCE --
----------------

config.color_scheme = 'Tokyo Night'
config.font = wezterm.font 'ComicCode Nerd Font'
config.window_background_opacity = 0.8
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

------------------
-- WINDOW TITLE --
------------------

wezterm.on('format-window-title', function(tab, pane, tabs, panes, config)
  local zoomed = ''
  if tab.active_pane.is_zoomed then
    zoomed = '[Z] '
  end

  local index = ''
  if #tabs > 1 then
    index = string.format('[%d/%d] ', tab.tab_index + 1, #tabs)
  end

  if pane.foreground_process_name == "/usr/bin/btop" then
    return "  Btop"
  end

  if pane.foreground_process_name == "/usr/bin/bluetui" then
    return "󰂯  Bluetooth TUI"
  end

  if pane.foreground_process_name == "/usr/bin/nmtui" then
    return "󰤨  Network Manager TUI"
  end

  -- return zoomed .. index .. tab.active_pane.title .. " | " .. pane.foreground_process_name
  return zoomed .. index .. tab.active_pane.title
end)

------------
-- KEYMAP --
------------
config.disable_default_key_bindings = true

config.keys = {
  { key = 'C', mods = 'CTRL|SHIFT', action = wezterm.action.CopyTo 'ClipboardAndPrimarySelection', },
  { key = 'V', mods = 'CTRL|SHIFT', action = wezterm.action.PasteFrom 'Clipboard', },
  { key = 'Copy', mods = 'NONE', action = act.CopyTo 'ClipboardAndPrimarySelection' },
  { key = 'Paste', mods = 'NONE', action = act.PasteFrom 'Clipboard' },
  { key = 'Insert', mods = 'SHIFT', action = act.PasteFrom 'PrimarySelection' },
  { key = 'Insert', mods = 'CTRL', action = act.CopyTo 'PrimarySelection' },

  { key = 'Tab', mods = 'CTRL', action = act.ActivateTabRelative(1) },
  { key = 'Tab', mods = 'SHIFT|CTRL', action = act.ActivateTabRelative(-1) },
  { key = 'Enter', mods = 'ALT', action = act.ToggleFullScreen },
  { key = '\"', mods = 'ALT|CTRL', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },
  { key = '\"', mods = 'SHIFT|ALT|CTRL', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },
  { key = '\'', mods = 'SHIFT|ALT|CTRL', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },
  { key = '%', mods = 'ALT|CTRL', action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },
  { key = '%', mods = 'SHIFT|ALT|CTRL', action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },
  { key = '5', mods = 'SHIFT|ALT|CTRL', action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },

  { key = ')', mods = 'CTRL', action = act.ResetFontSize },
  { key = ')', mods = 'SHIFT|CTRL', action = act.ResetFontSize },
  { key = '0', mods = 'CTRL', action = act.ResetFontSize },
  { key = '0', mods = 'SHIFT|CTRL', action = act.ResetFontSize },
  { key = '0', mods = 'SUPER', action = act.ResetFontSize },

  { key = '+', mods = 'CTRL', action = act.IncreaseFontSize },
  { key = '+', mods = 'SHIFT|CTRL', action = act.IncreaseFontSize },
  { key = '=', mods = 'CTRL', action = act.IncreaseFontSize },
  { key = '=', mods = 'SHIFT|CTRL', action = act.IncreaseFontSize },

  { key = '-', mods = 'CTRL', action = act.DecreaseFontSize },
  { key = '-', mods = 'SHIFT|CTRL', action = act.DecreaseFontSize },
  { key = '_', mods = 'CTRL', action = act.DecreaseFontSize },
  { key = '_', mods = 'SHIFT|CTRL', action = act.DecreaseFontSize },

  { key = '!', mods = 'CTRL', action = act.ActivateTab(0) },
  { key = '!', mods = 'SHIFT|CTRL', action = act.ActivateTab(0) },
  { key = '1', mods = 'SHIFT|CTRL', action = act.ActivateTab(0) },
  { key = '@', mods = 'CTRL', action = act.ActivateTab(1) },
  { key = '@', mods = 'SHIFT|CTRL', action = act.ActivateTab(1) },
  { key = '2', mods = 'SHIFT|CTRL', action = act.ActivateTab(1) },
  { key = '#', mods = 'CTRL', action = act.ActivateTab(2) },
  { key = '#', mods = 'SHIFT|CTRL', action = act.ActivateTab(2) },
  { key = '$', mods = 'CTRL', action = act.ActivateTab(3) },
  { key = '$', mods = 'SHIFT|CTRL', action = act.ActivateTab(3) },
  { key = '4', mods = 'SHIFT|CTRL', action = act.ActivateTab(3) },
  { key = '%', mods = 'CTRL', action = act.ActivateTab(4) },
  { key = '%', mods = 'SHIFT|CTRL', action = act.ActivateTab(4) },
  { key = '5', mods = 'SHIFT|CTRL', action = act.ActivateTab(4) },
  { key = '^', mods = 'CTRL', action = act.ActivateTab(5) },
  { key = '^', mods = 'SHIFT|CTRL', action = act.ActivateTab(5) },
  { key = '6', mods = 'SHIFT|CTRL', action = act.ActivateTab(5) },
  { key = '&', mods = 'CTRL', action = act.ActivateTab(6) },
  { key = '&', mods = 'SHIFT|CTRL', action = act.ActivateTab(6) },
  { key = '7', mods = 'SHIFT|CTRL', action = act.ActivateTab(6) },
  { key = '*', mods = 'CTRL', action = act.ActivateTab(7) },
  { key = '*', mods = 'SHIFT|CTRL', action = act.ActivateTab(7) },
  { key = '8', mods = 'SHIFT|CTRL', action = act.ActivateTab(7) },
  { key = '(', mods = 'CTRL', action = act.ActivateTab(-1) },
  { key = '(', mods = 'SHIFT|CTRL', action = act.ActivateTab(-1) },
  { key = '9', mods = 'SHIFT|CTRL', action = act.ActivateTab(-1) },

  { key = 'F', mods = 'CTRL', action = act.Search 'CurrentSelectionOrEmptyString' },
  { key = 'F', mods = 'SHIFT|CTRL', action = act.Search 'CurrentSelectionOrEmptyString' },

  { key = 'K', mods = 'CTRL', action = act.ClearScrollback 'ScrollbackOnly' },
  { key = 'K', mods = 'SHIFT|CTRL', action = act.ClearScrollback 'ScrollbackOnly' },

  { key = 'L', mods = 'CTRL', action = act.ShowDebugOverlay },
  { key = 'L', mods = 'SHIFT|CTRL', action = act.ShowDebugOverlay },

  { key = 'P', mods = 'CTRL', action = act.ActivateCommandPalette },
  { key = 'P', mods = 'SHIFT|CTRL', action = act.ActivateCommandPalette },

  { key = 'R', mods = 'CTRL', action = act.ReloadConfiguration },
  { key = 'R', mods = 'SHIFT|CTRL', action = act.ReloadConfiguration },

  { key = 'T', mods = 'CTRL|SHIFT', action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 'Q', mods = 'CTRL', action = act.CloseCurrentTab{ confirm = true } },
  { key = 'Q', mods = 'SHIFT|CTRL', action = act.CloseCurrentTab{ confirm = true } },

  -- { key = 'U', mods = 'CTRL', action = act.CharSelect{ copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },
  -- { key = 'U', mods = 'SHIFT|CTRL', action = act.CharSelect{ copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },

  { key = 'X', mods = 'CTRL', action = act.ActivateCopyMode },
  { key = 'X', mods = 'SHIFT|CTRL', action = act.ActivateCopyMode },

  { key = 'Z', mods = 'CTRL', action = act.TogglePaneZoomState },
  { key = 'Z', mods = 'SHIFT|CTRL', action = act.TogglePaneZoomState },

  { key = 'f', mods = 'SHIFT|CTRL', action = act.Search 'CurrentSelectionOrEmptyString' },

  { key = 'k', mods = 'SHIFT|CTRL', action = act.ClearScrollback 'ScrollbackOnly' },

  { key = 'l', mods = 'SHIFT|CTRL', action = act.ShowDebugOverlay },

  { key = 'p', mods = 'SHIFT|CTRL', action = act.ActivateCommandPalette },

  { key = 'r', mods = 'SHIFT|CTRL', action = act.ReloadConfiguration },
  { key = 'r', mods = 'SUPER', action = act.ReloadConfiguration },

  -- { key = 'u', mods = 'SHIFT|CTRL', action = act.CharSelect{ copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },

  { key = 'q', mods = 'SHIFT|CTRL', action = act.CloseCurrentTab{ confirm = true } },

  { key = 'x', mods = 'SHIFT|CTRL', action = act.ActivateCopyMode },

  { key = 'z', mods = 'SHIFT|CTRL', action = act.TogglePaneZoomState },

  { key = 'phys:Space', mods = 'SHIFT|CTRL', action = act.QuickSelect },

  { key = 'PageUp', mods = 'SHIFT', action = act.ScrollByPage(-1) },
  { key = 'PageDown', mods = 'SHIFT', action = act.ScrollByPage(1) },

  { key = 'H', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Left' },
  { key = 'H', mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize{ 'Left', 1 } },
  { key = 'L', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Right' },
  { key = 'L', mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize{ 'Right', 1 } },
  { key = 'K', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Up' },
  { key = 'K', mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize{ 'Up', 1 } },
  { key = 'J', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Down' },
  { key = 'J', mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize{ 'Down', 1 } },
}

config.key_tables = {
  copy_mode = {
    { key = 'Tab', mods = 'NONE', action = act.CopyMode 'MoveForwardWord' },
    { key = 'Tab', mods = 'SHIFT', action = act.CopyMode 'MoveBackwardWord' },
    { key = 'Enter', mods = 'NONE', action = act.CopyMode 'MoveToStartOfNextLine' },
    { key = 'Escape', mods = 'NONE', action = act.Multiple{ 'ScrollToBottom', { CopyMode =  'Close' } } },
    { key = 'Space', mods = 'NONE', action = act.CopyMode{ SetSelectionMode =  'Cell' } },
    { key = '$', mods = 'NONE', action = act.CopyMode 'MoveToEndOfLineContent' },
    { key = '$', mods = 'SHIFT', action = act.CopyMode 'MoveToEndOfLineContent' },
    { key = ',', mods = 'NONE', action = act.CopyMode 'JumpReverse' },
    { key = '0', mods = 'NONE', action = act.CopyMode 'MoveToStartOfLine' },
    { key = ';', mods = 'NONE', action = act.CopyMode 'JumpAgain' },
    { key = 'F', mods = 'NONE', action = act.CopyMode{ JumpBackward = { prev_char = false } } },
    { key = 'F', mods = 'SHIFT', action = act.CopyMode{ JumpBackward = { prev_char = false } } },
    { key = 'G', mods = 'NONE', action = act.CopyMode 'MoveToScrollbackBottom' },
    { key = 'G', mods = 'SHIFT', action = act.CopyMode 'MoveToScrollbackBottom' },
    { key = 'H', mods = 'NONE', action = act.CopyMode 'MoveToViewportTop' },
    { key = 'H', mods = 'SHIFT', action = act.CopyMode 'MoveToViewportTop' },
    { key = 'L', mods = 'NONE', action = act.CopyMode 'MoveToViewportBottom' },
    { key = 'L', mods = 'SHIFT', action = act.CopyMode 'MoveToViewportBottom' },
    { key = 'M', mods = 'NONE', action = act.CopyMode 'MoveToViewportMiddle' },
    { key = 'M', mods = 'SHIFT', action = act.CopyMode 'MoveToViewportMiddle' },
    { key = 'O', mods = 'NONE', action = act.CopyMode 'MoveToSelectionOtherEndHoriz' },
    { key = 'O', mods = 'SHIFT', action = act.CopyMode 'MoveToSelectionOtherEndHoriz' },
    { key = 'T', mods = 'NONE', action = act.CopyMode{ JumpBackward = { prev_char = true } } },
    { key = 'T', mods = 'SHIFT', action = act.CopyMode{ JumpBackward = { prev_char = true } } },
    { key = 'V', mods = 'NONE', action = act.CopyMode{ SetSelectionMode =  'Line' } },
    { key = 'V', mods = 'SHIFT', action = act.CopyMode{ SetSelectionMode =  'Line' } },
    { key = '^', mods = 'NONE', action = act.CopyMode 'MoveToStartOfLineContent' },
    { key = '^', mods = 'SHIFT', action = act.CopyMode 'MoveToStartOfLineContent' },
    { key = 'b', mods = 'NONE', action = act.CopyMode 'MoveBackwardWord' },
    { key = 'b', mods = 'ALT', action = act.CopyMode 'MoveBackwardWord' },
    { key = 'b', mods = 'CTRL', action = act.CopyMode 'PageUp' },
    { key = 'c', mods = 'CTRL', action = act.Multiple{ 'ScrollToBottom', { CopyMode =  'Close' } } },
    { key = 'd', mods = 'CTRL', action = act.CopyMode{ MoveByPage = (0.5) } },
    { key = 'e', mods = 'NONE', action = act.CopyMode 'MoveForwardWordEnd' },
    { key = 'f', mods = 'NONE', action = act.CopyMode{ JumpForward = { prev_char = false } } },
    { key = 'f', mods = 'ALT', action = act.CopyMode 'MoveForwardWord' },
    { key = 'f', mods = 'CTRL', action = act.CopyMode 'PageDown' },
    { key = 'g', mods = 'NONE', action = act.CopyMode 'MoveToScrollbackTop' },
    { key = 'g', mods = 'CTRL', action = act.Multiple{ 'ScrollToBottom', { CopyMode =  'Close' } } },
    { key = 'h', mods = 'NONE', action = act.CopyMode 'MoveLeft' },
    { key = 'j', mods = 'NONE', action = act.CopyMode 'MoveDown' },
    { key = 'k', mods = 'NONE', action = act.CopyMode 'MoveUp' },
    { key = 'l', mods = 'NONE', action = act.CopyMode 'MoveRight' },
    { key = 'm', mods = 'ALT', action = act.CopyMode 'MoveToStartOfLineContent' },
    { key = 'o', mods = 'NONE', action = act.CopyMode 'MoveToSelectionOtherEnd' },
    { key = 'q', mods = 'NONE', action = act.Multiple{ 'ScrollToBottom', { CopyMode =  'Close' } } },
    { key = 't', mods = 'NONE', action = act.CopyMode{ JumpForward = { prev_char = true } } },
    { key = 'u', mods = 'CTRL', action = act.CopyMode{ MoveByPage = (-0.5) } },
    { key = 'v', mods = 'NONE', action = act.CopyMode{ SetSelectionMode =  'Cell' } },
    { key = 'v', mods = 'CTRL', action = act.CopyMode{ SetSelectionMode =  'Block' } },
    { key = 'w', mods = 'NONE', action = act.CopyMode 'MoveForwardWord' },
    { key = 'y', mods = 'NONE', action = act.Multiple{ { CopyTo =  'ClipboardAndPrimarySelection' }, { Multiple = { 'ScrollToBottom', { CopyMode =  'Close' } } } } },
    { key = 'PageUp', mods = 'NONE', action = act.CopyMode 'PageUp' },
    { key = 'PageDown', mods = 'NONE', action = act.CopyMode 'PageDown' },
    { key = 'End', mods = 'NONE', action = act.CopyMode 'MoveToEndOfLineContent' },
    { key = 'Home', mods = 'NONE', action = act.CopyMode 'MoveToStartOfLine' },
    { key = 'LeftArrow', mods = 'NONE', action = act.CopyMode 'MoveLeft' },
    { key = 'LeftArrow', mods = 'ALT', action = act.CopyMode 'MoveBackwardWord' },
    { key = 'RightArrow', mods = 'NONE', action = act.CopyMode 'MoveRight' },
    { key = 'RightArrow', mods = 'ALT', action = act.CopyMode 'MoveForwardWord' },
    { key = 'UpArrow', mods = 'NONE', action = act.CopyMode 'MoveUp' },
    { key = 'DownArrow', mods = 'NONE', action = act.CopyMode 'MoveDown' },
  },

  search_mode = {
    { key = 'Enter', mods = 'NONE', action = act.CopyMode 'PriorMatch' },
    { key = 'Escape', mods = 'NONE', action = act.CopyMode 'Close' },
    { key = 'n', mods = 'CTRL', action = act.CopyMode 'NextMatch' },
    { key = 'p', mods = 'CTRL', action = act.CopyMode 'PriorMatch' },
    { key = 'r', mods = 'CTRL', action = act.CopyMode 'CycleMatchType' },
    { key = 'u', mods = 'CTRL', action = act.CopyMode 'ClearPattern' },
    { key = 'PageUp', mods = 'NONE', action = act.CopyMode 'PriorMatchPage' },
    { key = 'PageDown', mods = 'NONE', action = act.CopyMode 'NextMatchPage' },
    { key = 'UpArrow', mods = 'NONE', action = act.CopyMode 'PriorMatch' },
    { key = 'DownArrow', mods = 'NONE', action = act.CopyMode 'NextMatch' },
  },
}

return config

