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
	default_prog                 = { '/opt/homebrew/bin/zsh', '--login', '--interactive', '-c', 'tmux new -A' },
	exit_behavior                = 'CloseOnCleanExit',
	color_scheme                 = scheme_for_appearance('vscode', get_appearance()),
	color_schemes                = require('color-schemes'),
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
	keys                         = require('keys'),
	quick_select_patterns        = {
		'[\\w,]+',
	},
}
