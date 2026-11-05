---@diagnostic disable:undefined-global
local config = hl.config
local plugin = hl.plugin
---@diagnostic enable:undefined-global
local colors = require('utils.colors')

local size = {
	button             = 16,
	bar_height         = 32,
	bar_text           = 16,
	bar_padding        = 8,
	bar_button_padding = 6,
}

config({
	plugin = {
		hyprbars = {
			bar_title_enabled          = true,
			bar_text_size              = size.bar_text,
			bar_height                 = size.bar_height,
			bar_padding                = size.bar_padding,
			bar_button_padding         = size.bar_button_padding,
			bar_part_of_window         = true,
			bar_precedence_over_border = true,
			bar_buttons_alignment      = 'left',
		},
	}
})

plugin.hyprbars.add_button({
	bg_color = colors.red,
	fg_color = colors.red,
	size     = size.button,
	icon     = '',
	action   = [[hyprctl dispatch 'hl.dsp.window.close()']],
})

plugin.hyprbars.add_button({
	bg_color = colors.green,
	fg_color = colors.green,
	size     = size.button,
	icon     = '',
	action   = [[hyprctl dispatch 'hl.dsp.window.fullscreen({ mode = "fullscreen", layout_aware = false })']],
})

plugin.hyprbars.add_button({
	bg_color = colors.cyan,
	fg_color = colors.cyan,
	size     = size.button,
	icon     = '',
	action   = [[hyprctl dispatch 'hl.dsp.window.fullscreen({ mode = "maximized", layout_aware = false })']],
})

plugin.hyprbars.add_button({
	bg_color = colors.yellow,
	fg_color = colors.yellow,
	size     = size.button,
	icon     = '',
	action   = [[hyprctl dispatch 'hl.dsp.window.float()']],
})
