local actions = require('wezterm').action

return {
	{ key = 'q', mods = 'SUPER',      action = actions.QuitApplication },
	{ key = 'h', mods = 'SUPER',      action = actions.HideApplication },
	{ key = 'p', mods = 'SUPER',      action = actions.ActivateCommandPalette },
	{ key = '0', mods = 'SUPER',      action = actions.ResetFontSize },
	{ key = '-', mods = 'SUPER',      action = actions.DecreaseFontSize },
	{ key = '=', mods = 'SUPER',      action = actions.IncreaseFontSize },
	{ key = 'c', mods = 'SUPER',      action = actions.CopyTo 'Clipboard' },
	{ key = 'v', mods = 'SUPER',      action = actions.PasteFrom 'Clipboard' },
	{ key = ' ', mods = 'SHIFT|CTRL', action = actions.QuickSelect },
	{ key = '?', mods = 'SHIFT|CTRL', action = actions.ShowLauncher },
	{ key = '|', mods = 'SHIFT|CTRL', action = actions.ShowDebugOverlay },
	{ key = 'f', mods = 'SUPER|CTRL', action = actions.ToggleFullScreen },
}
