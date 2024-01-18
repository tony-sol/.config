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
				autofold_depth    = nil,
				auto_unfold_hover = true,
				markers           = { '', '' },
			},
			guides         = {
				enabled = true,
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
				highlight_hovered_item = true,
			},
			provider       = {

			},
		}
	end
}
