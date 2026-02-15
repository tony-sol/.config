return {
	'nvim-treesitter/nvim-treesitter',
	branch       = 'main',
	priority     = 50,
	dependencies = {
		{
			'nvim-treesitter/nvim-treesitter-context',
			branch = 'master',
		},
		{
			'nvim-treesitter/nvim-treesitter-locals',
			branch = 'main',
		},
		{
			'nvim-treesitter/nvim-treesitter-textobjects',
			branch = 'main',
		},
		{
			'OXY2DEV/markview.nvim',
		},
	},
	build        = ':TSUpdate',
	opts         = {
	}
}
