local wezterm = require('wezterm')

---@return 'Dark' | 'Light'
local function get_appearance()
	return wezterm.gui and wezterm.gui.get_appearance() or 'Dark'
end

---@param appearance string
---@return 'vscode_dark' | 'vscode_light'
local function scheme_for_appearance(appearance)
	return appearance:find('Dark') and 'vscode_dark' or 'vscode_light'
end

return {
	term                         = 'xterm-256color',
	default_prog                 = { '/bin/zsh', '--login', '--interactive', '-c', 'tmux new -A' },
	exit_behavior                = 'CloseOnCleanExit',
	color_scheme                 = scheme_for_appearance(get_appearance()),
	color_schemes                = {
		vscode_dark = {
			background = '#1E1E1E',
			foreground = '#CCCCCC',
			ansi       = {
				'#000000', -- black
				'#CD3131', -- red
				'#0DBC79', -- green
				'#E5E510', -- yellow
				'#2472C8', -- blue
				'#BC3FBC', -- magenta
				'#11A8CD', -- cyan
				'#E5E5E5', -- white
			},
			brights    = {
				'#666666', -- black
				'#F14C4C', -- red
				'#23D18B', -- green
				'#F5F543', -- yellow
				'#3B8EEA', -- blue
				'#D670D6', -- magenta
				'#29B8DB', -- cyan
				'#E5E5E5', -- white
			},
		},
		vscode_light = {
			background = '#F9F9F9',
			foreground = '#020202',
			ansi       = {
				'#020202', -- black
				'#CD3232', -- red
				'#00BC00', -- green
				'#A5A900', -- yellow
				'#0752A8', -- blue
				'#BC05BC', -- magenta
				'#0598BC', -- cyan
				'#343434', -- white
			},
			brights    = {
				'#5E5E5E', -- black
				'#CD3333', -- red
				'#1BCE1A', -- green
				'#ADBB5B', -- yellow
				'#0752A8', -- blue
				'#C451CE', -- magenta
				'#52A8C7', -- cyan
				'#A6A3A6', -- white
			},
		},
	},
	force_reverse_video_cursor   = true,
	bold_brightens_ansi_colors   = true, --"BrightAndBold" in nightly builds
	unicode_version              = 14,
	custom_block_glyphs          = false,
	font                         = wezterm.font_with_fallback {
		{
			family                    = 'JetBrainsMono Nerd Font',
			weight                    = 'Medium',
			harfbuzz_features         = { 'calt=1', 'clig=1', 'liga=1' },
			assume_emoji_presentation = false,
		},
		{
			family                    = 'Menlo',
			weight                    = 'Medium',
			harfbuzz_features         = { 'calt=1', 'clig=1', 'liga=1' },
			assume_emoji_presentation = true,
		},
	},
	font_size                    = 14.0,
	initial_cols                 = 120,
	initial_rows                 = 40,
	window_padding               = { left = 4, right = 4, top = 1, bottom = 1 },
	enable_tab_bar               = false,
	scrollback_lines             = 1000000,
	native_macos_fullscreen_mode = true,
	disable_default_key_bindings = true,
	keys                         = {
		{ key = 'q', mods = 'SUPER',      action = wezterm.action.QuitApplication },
		{ key = 'h', mods = 'SUPER',      action = wezterm.action.HideApplication },
		{ key = '0', mods = 'SUPER',      action = wezterm.action.ResetFontSize },
		{ key = '-', mods = 'SUPER',      action = wezterm.action.DecreaseFontSize },
		{ key = '=', mods = 'SUPER',      action = wezterm.action.IncreaseFontSize },
		{ key = 'c', mods = 'SUPER',      action = wezterm.action.CopyTo 'Clipboard' },
		{ key = 'v', mods = 'SUPER',      action = wezterm.action.PasteFrom 'Clipboard' },
		{ key = ' ', mods = 'SHIFT|CTRL', action = wezterm.action.QuickSelect },
		{ key = '?', mods = 'SHIFT|CTRL', action = wezterm.action.ShowLauncher },
		{ key = '|', mods = 'SHIFT|CTRL', action = wezterm.action.ShowDebugOverlay },
		{ key = 'f', mods = 'SUPER|CTRL', action = wezterm.action.ToggleFullScreen },
	},
	quick_select_patterns        = {
		'[\\w,]+',
	},
}
