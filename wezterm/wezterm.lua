local appearance = require('appearance')
local font       = require('font')
local keymaps    = require('keymaps')

return {
	term                         = 'xterm-256color',
	default_prog                 = { 'zsh', '--login', '--interactive', '-c', 'tmux new -A' },
	exit_behavior                = 'CloseOnCleanExit',
	scrollback_lines             = 1000000,
	-- Appearance - window
	window_padding               = { left = 1, right = 1, top = 1, bottom = 1 },
	window_decorations           = 'RESIZE',
	initial_cols                 = 120,
	initial_rows                 = 40,
	hide_tab_bar_if_only_one_tab = true,
	native_macos_fullscreen_mode = true,
	-- Appearance - colors
	color_scheme                 = appearance('tokyonight'),
	force_reverse_video_cursor   = true,
	bold_brightens_ansi_colors   = 'BrightAndBold',
	-- Font
	unicode_version              = 14,
	custom_block_glyphs          = false,
	font                         = font,
	font_size                    = 14.0,
	command_palette_font_size    = 14.0,
	-- Keymap
	disable_default_key_bindings = true,
	keys                         = keymaps,
}
