return {
	'hedyhli/outline.nvim',
	config = function()
		local outline = require('outline')
		local utils   = require('utils')
		outline.setup {
			symbols        = {
				filter = {
				},
			},
			symbol_folding = {
				autofold_depth    = 1,
				auto_unfold       = {
					only = 2,
				},
				auto_unfold_hover = true,
				markers           = {
					utils.defaultFillchars().foldclose,
					utils.defaultFillchars().foldopen,
				},
			},
			guides         = {
				enabled = true,
				markers = {
					bottom     = utils.specialChars().corner.upright,
					middle     = utils.defaultFillchars().vertright,
					vertical   = utils.defaultFillchars().vert,
					horizontal = utils.defaultFillchars().horiz,
				},
			},
			preview_window = {
				auto_preview = false,
			},
			outline_window = {
				width                 = utils.defaultSidebarSize(),
				relative_width        = true,
				position              = 'right',
				wrap                  = false,
				auto_close            = false,
				show_numbers          = true,
				show_relative_numbers = true,
				show_cursorline       = true,
			},
			outline_items  = {
				show_symbol_details    = true,
				show_symbol_lineno     = false,
				highlight_hovered_item = true,
			},
			provider       = {
			},
		}
	end
}
