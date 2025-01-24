return {
	'OXY2DEV/markview.nvim',
	dependencies = {
		{
			'nvim-tree/nvim-web-devicons',
		},
	},
	lazy         = false,
	config       = function()
		local markview = require('markview')
		local presets  = require('markview.presets')

		local headings = {
			heading_1 = { sign = "󰌕", sign_hl = "MarkviewHeading1Sign", },
			heading_2 = { sign = "󰌖", sign_hl = "MarkviewHeading2Sign", },
			heading_3 = { sign = "󰌕", sign_hl = "MarkviewHeading3Sign", },
			heading_4 = { sign = "󰌖", sign_hl = "MarkviewHeading4Sign", },
			heading_5 = { sign = "󰌕", sign_hl = "MarkviewHeading5Sign", },
			heading_6 = { sign = "󰌖", sign_hl = "MarkviewHeading6Sign", },
		}
		markview.setup {
			html            = {
				headings = headings
			},
			markdown        = {
				horizontal_rules = presets.horizontal_rules.thick,
				headings         = headings
			},
			markdown_inline = {
				checkboxes = presets.checkboxes.nerd,
			},
		}
	end
}
