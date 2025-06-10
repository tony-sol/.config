local appearance         = require('appearance')
local font               = require('font')
local keymaps            = require('keymaps')
local launch_menu        = require('launch_menu')

return {
	term                                       = 'xterm-256color',
	launch_menu                                = launch_menu,
	default_prog                               = { 'zsh', '-cli', 'tmux new' },
	exit_behavior                              = 'CloseOnCleanExit',
	scrollback_lines                           = 2000000,
	-- Appearance - window
	window_padding                             = { left = 1, right = 1, top = 1, bottom = 1 },
	window_decorations                         = appearance.decorations,
	adjust_window_size_when_changing_font_size = false,
	tab_bar_at_bottom                          = true,
	hide_tab_bar_if_only_one_tab               = true,
	native_macos_fullscreen_mode               = true,
	-- Appearance - colors
	color_scheme                               = appearance.color_scheme,
	force_reverse_video_cursor                 = true,
	bold_brightens_ansi_colors                 = 'BrightAndBold',
	window_background_opacity                  = 0.80,
	-- Font
	unicode_version                            = 16,
	custom_block_glyphs                        = false,
	font                                       = font,
	font_size                                  = 14.0,
	command_palette_font_size                  = 14.0,
	-- Keymap
	disable_default_key_bindings               = true,
	leader                                     = keymaps.leader(),
	keys                                       = keymaps.list(),
}
