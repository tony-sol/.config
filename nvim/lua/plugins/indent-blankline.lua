return {
	'lukas-reineke/indent-blankline.nvim',
	dependencies = {
		{
			'nvim-treesitter/nvim-treesitter',
		},
	},
	config = function ()
		local indent_blankline = require('indent_blankline')
		indent_blankline.setup {
			use_treesitter                        = true,
			use_treesitter_scope                  = false,
			show_first_indent_level               = true,
			show_current_context                  = true,
			show_current_context_start            = true,
			current_context_start_on_current_line = true,
			show_end_of_line                      = true,
			space_char_blankline                  = '',
			char                                  = '│',
			char_blankline                        = '',
		}
	end
}
