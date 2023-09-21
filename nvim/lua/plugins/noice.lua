return {
	'folke/noice.nvim',
	dependencies = {
		{
			'MunifTanjim/nui.nvim',
		},
		{
			'rcarriga/nvim-notify',
		},
	},
	config       = function()
		local notify = require('notify')
		notify.setup {
			background_colour = 'NotifyBackground',
			fps               = 60,
			icons             = {
				DEBUG = '',
				ERROR = '',
				INFO  = '',
				TRACE = '✎',
				WARN  = '',
			},
			level             = 2,
			minimum_width     = 50,
			render            = 'default',
			stages            = 'fade_in_slide_out',
			timeout           = 3000,
			top_down          = false,
		}
		local noice = require('noice')
		noice.setup {
			lsp = {
				override = {
					['vim.lsp.util.convert_input_to_markdown_lines'] = true,
					['vim.lsp.util.stylize_markdown']                = true,
					['cmp.entry.get_documentation']                  = true,
				},
			},
			presets = {
				bottom_search   = false,
				lsp_doc_border  = true,
				command_palette = true,
			},
		}
	end
}
