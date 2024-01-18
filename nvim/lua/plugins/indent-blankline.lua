return {
	'lukas-reineke/indent-blankline.nvim',
	dependencies = {
		{
			'nvim-treesitter/nvim-treesitter',
		},
	},
	config       = function()
		local ibl   = require('ibl')
		local hooks = require('ibl.hooks')
		local utils = require('utils')
		hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
		hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_tab_indent_level)
		hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
		ibl.setup {
			indent = {
				char     = utils.defaultFillchars().vert,
				tab_char = utils.defaultFillchars().vert,
			},
		}
	end
}
