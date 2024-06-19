return {
	'hedyhli/outline.nvim',
	config = function()
		local fchars  = require('utils').defaultFillchars()
		local schars  = require('utils').specialChars()
		local utils   = require('utils')
		local outline = require('outline')
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
					fchars.foldclose,
					fchars.foldopen,
				},
			},
			guides         = {
				enabled = true,
				markers = {
					bottom     = schars.corner.upright,
					middle     = fchars.vertright,
					vertical   = fchars.vert,
					horizontal = fchars.horiz,
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
