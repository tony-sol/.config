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
			show_current_context       = true,
			show_current_context_start = true,
			show_end_of_line           = true,
		}
	end
}
