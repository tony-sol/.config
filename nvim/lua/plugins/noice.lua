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
	opts         = {
		lsp     = {
			override = {
				['vim.lsp.util.convert_input_to_markdown_lines'] = true,
				['vim.lsp.util.stylize_markdown']                = true,
				['cmp.entry.get_documentation']                  = true,
			},
		},
		presets = {
			bottom_search   = false,
			command_palette = true,
			lsp_doc_border  = true,
		},
	}
}
