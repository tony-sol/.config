return {
	'nvim-treesitter/nvim-treesitter',
	dependencies = {
		{
			'nvim-treesitter/nvim-treesitter-context',
		},
		{
			'nvim-treesitter/nvim-treesitter-refactor',
		},
		{
			'nvim-treesitter/nvim-treesitter-textobjects',
		},
		{
			'nvim-neorg/neorg',
		},
		{
			'lukas-reineke/headlines.nvim',
		},
	},
	build = ':TSUpdate',
	config = function()
		local treesitter_configs = require('nvim-treesitter.configs')
		treesitter_configs.setup {
			auto_install     = true,
			ensure_installed = 'all',
			highlight        = {
				enable = true,
			},
			refactor         = {
				highlight_definitions   = { enable = true },
				highlight_current_scope = { enable = true },
				smart_rename            = { enable = true },
				navigation              = { enable = true },
			},
			textobjects      = {
				select = { enable = true },
				swap   = { enable = false },
				move   = { enable = true },
			},
		}
		local treesitter_context = require('treesitter-context')
		treesitter_context.setup {
		}
	end
}
