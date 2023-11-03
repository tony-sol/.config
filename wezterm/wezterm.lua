local wezterm = require('wezterm')

---@return 'Dark' | 'Light'
local function get_appearance()
	return wezterm.gui and wezterm.gui.get_appearance() or 'Dark'
end

---@param family string
---@param appearance string
---@return string
local function scheme_for_appearance(family, appearance)
	local switch = {
		['vscode'] = function(_appearance)
			return _appearance:find('Dark') and 'vscode_dark' or 'vscode_light'
		end,
		['tokyonight'] = function(_appearance)
			return _appearance:find('Dark') and 'tokyonight_night' or 'tokyonight_day'
		end,
	}
	return switch[family](appearance)
end

return {
	term                         = 'xterm-256color',
	default_prog                 = { '/bin/zsh', '--login', '--interactive', '-c', 'tmux new -A' },
	exit_behavior                = 'CloseOnCleanExit',
	color_scheme                 = scheme_for_appearance('vscode', get_appearance()),
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
		tokyonight_day = {
			background     = '#E1E2E7',
			foreground     = '#3760BF',
			cursor_bg      = '#3760BF',
			cursor_border  = '#3760BF',
			cursor_fg      = '#E1E2E7',
			selection_bg   = '#B6BFE2',
			selection_fg   = '#3760BF',
			split          = '#2E7DE9',
			compose_cursor = '#B15C00',
			ansi           = {
				'#E9E9ED', -- black
				'#F52A65', -- red
				'#587539', -- green
				'#8C6C3E', -- yellow
				'#2E7DE9', -- blue
				'#9854F1', -- magenta
				'#007197', -- cyan
				'#6172B0', -- white
			},
			brights        = {
				'#A1A6C5', -- black
				'#F52A65', -- red
				'#587539', -- green
				'#8C6C3E', -- yellow
				'#2E7DE9', -- blue
				'#9854F1', -- magenta
				'#007197', -- cyan
				'#3760BF', -- white
			},
		},
		tokyonight_moon = {
			foreground     = '#C8D3F5',
			background     = '#222436',
			cursor_bg      = '#C8D3F5',
			cursor_border  = '#C8D3F5',
			cursor_fg      = '#222436',
			selection_bg   = '#2D3F76',
			selection_fg   = '#C8D3F5',
			split          = '#82AAFF',
			compose_cursor = '#FF966C',
			ansi           = {
				'#1B1D2B', -- black
				'#FF757F', -- red
				'#C3E88D', -- green
				'#FFC777', -- yellow
				'#82AAFF', -- blue
				'#C099FF', -- magenta
				'#86E1FC', -- cyan
				'#828BB8', -- white
			},
			brights        = {
				'#444A73', -- black
				'#FF757F', -- red
				'#C3E88D', -- green
				'#FFC777', -- yellow
				'#82AAFF', -- blue
				'#C099FF', -- magenta
				'#86E1FC', -- cyan
				'#C8D3F5', -- white
			},
		},
		tokyonight_night = {
			foreground     = '#C0CAF5',
			background     = '#1A1B26',
			cursor_bg      = '#C0CAF5',
			cursor_border  = '#C0CAF5',
			cursor_fg      = '#1A1B26',
			selection_bg   = '#283457',
			selection_fg   = '#C0CAF5',
			split          = '#7AA2F7',
			compose_cursor = '#FF9E64',
			ansi           = {
				'#15161E', -- black
				'#F7768E', -- red
				'#9ECE6A', -- green
				'#E0AF68', -- yellow
				'#7AA2F7', -- blue
				'#BB9AF7', -- magenta
				'#7DCFFF', -- cyan
				'#A9B1D6', -- white
			},
			brights        = {
				'#414868', -- black
				'#F7768E', -- red
				'#9ECE6A', -- green
				'#E0AF68', -- yellow
				'#7AA2F7', -- blue
				'#BB9AF7', -- magenta
				'#7DCFFF', -- cyan
				'#C0CAF5', -- white
			},
		},
		tokyonight_storm = {
			foreground     = '#C0CAF5',
			background     = '#24283B',
			cursor_bg      = '#C0CAF5',
			cursor_border  = '#C0CAF5',
			cursor_fg      = '#24283B',
			selection_bg   = '#2E3C64',
			selection_fg   = '#C0CAF5',
			split          = '#7AA2F7',
			compose_cursor = '#FF9E64',
			ansi           = {
				'#1D202F', -- black
				'#F7768E', -- red
				'#9ECE6A', -- green
				'#E0AF68', -- yellow
				'#7AA2F7', -- blue
				'#BB9AF7', -- magenta
				'#7DCFFF', -- cyan
				'#A9B1D6', -- white
			},
			brights        = {
				'#414868', -- black
				'#F7768E', -- red
				'#9ECE6A', -- green
				'#E0AF68', -- yellow
				'#7AA2F7', -- blue
				'#BB9AF7', -- magenta
				'#7DCFFF', -- cyan
				'#C0CAF5', -- white
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
