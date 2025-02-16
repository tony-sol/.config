local actions = require('wezterm').action

return {
	-- window control
	{ key = 'f',   mods = 'SUPER|CTRL', action = actions.ToggleFullScreen },
	{ key = 'q',   mods = 'SUPER',      action = actions.QuitApplication },
	{ key = 'h',   mods = 'SUPER',      action = actions.HideApplication },
	-- text control
	{ key = '0',   mods = 'SUPER',      action = actions.ResetFontSize },
	{ key = '-',   mods = 'SUPER',      action = actions.DecreaseFontSize },
	{ key = '=',   mods = 'SUPER',      action = actions.IncreaseFontSize },
	{ key = 'c',   mods = 'SUPER',      action = actions.CopyTo 'Clipboard' },
	{ key = 'v',   mods = 'SUPER',      action = actions.PasteFrom 'Clipboard' },
	-- menus
	{ key = 'p',   mods = 'SUPER|CTRL', action = actions.ActivateCommandPalette },
	{ key = 'F2',  mods = 'ALT',        action = actions.ShowLauncherArgs({ flags = 'COMMANDS' }) },
	{ key = 'F3',  mods = 'ALT',        action = actions.ShowLauncherArgs({ flags = 'LAUNCH_MENU_ITEMS' }) },
	{ key = 'F4',  mods = 'ALT',        action = actions.ShowLauncherArgs({ flags = 'TABS' }) },
	{ key = 'F5',  mods = 'ALT',        action = actions.ShowLauncherArgs({ flags = 'DOMAINS' }) },
	{ key = 'F6',  mods = 'ALT',        action = actions.ShowLauncherArgs({ flags = 'WORKSPACES' }) },
	{ key = 'F12', mods = 'ALT',        action = actions.ShowDebugOverlay },
}
