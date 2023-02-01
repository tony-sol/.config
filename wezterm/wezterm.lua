local wezterm = require "wezterm"
return {
	term          = "xterm-256color",
	default_prog  = { "/bin/zsh", "-l", "-c", "tmux attach || tmux" },
	color_scheme  = "vscode",
	color_schemes = {
		vscode = {
			background = "#1e1e1e",
			foreground = "#cccccc",
			ansi       = {
				"#000000", -- black
				"#cd3131", -- red
				"#0dbc79", -- green
				"#e5e510", -- yellow
				"#2472c8", -- blue
				"#bc3fbc", -- magenta
				"#11a8cd", -- cyan
				"#e5e5e5", -- white
			},
			brights    = {
				"#666666", -- black
				"#f14c4c", -- red
				"#23d18b", -- green
				"#f5f543", -- yellow
				"#3b8eea", -- blue
				"#d670d6", -- magenta
				"#29b8db", -- cyan
				"#e5e5e5", -- white
			},
		},
	},
	force_reverse_video_cursor = true,
	bold_brightens_ansi_colors = true, --"BrightAndBold" in nightly builds
	unicode_version            = 14,
	custom_block_glyphs        = false,
	font                       = wezterm.font_with_fallback {
		{
			family                    = "JetBrainsMono Nerd Font",
			weight                    = "Regular",
			harfbuzz_features         = { "calt=1", "clig=1", "liga=1" },
			assume_emoji_presentation = false,
		},
		{
			family                    = "Menlo",
			weight                    = "Regular",
			harfbuzz_features         = { "calt=1", "clig=1", "liga=1" },
			assume_emoji_presentation = true,
		},
	},
	font_size                    = 12.0,
	initial_cols                 = 120,
	initial_rows                 = 40,
	window_padding               = { left = 1, right = 1, top = 1, bottom = 1 },
	enable_tab_bar               = false,
	scrollback_lines             = 100000,
	native_macos_fullscreen_mode = true,
	disable_default_key_bindings = true,
	keys                         = {
		{ key = 'q',  mods = 'SUPER',      action = wezterm.action.QuitApplication       },
		{ key = 'h',  mods = 'SUPER',      action = wezterm.action.HideApplication       },
		{ key = '0',  mods = 'SUPER',      action = wezterm.action.ResetFontSize         },
		{ key = '-',  mods = 'SUPER',      action = wezterm.action.DecreaseFontSize      },
		{ key = '=',  mods = 'SUPER',      action = wezterm.action.IncreaseFontSize      },
		{ key = 'c',  mods = 'SUPER',      action = wezterm.action.CopyTo 'Clipboard'    },
		{ key = 'v',  mods = 'SUPER',      action = wezterm.action.PasteFrom 'Clipboard' },
		{ key = ' ',  mods = 'SHIFT|CTRL', action = wezterm.action.QuickSelect           },
		{ key = '?',  mods = 'SHIFT|CTRL', action = wezterm.action.ShowLauncher          },
		{ key = '|',  mods = 'SHIFT|CTRL', action = wezterm.action.ShowDebugOverlay      },
		{ key = 'f',  mods = 'SUPER|CTRL', action = wezterm.action.ToggleFullScreen      },
	},
	quick_select_patterns = {
		'[\\w,]+',
	},
}
