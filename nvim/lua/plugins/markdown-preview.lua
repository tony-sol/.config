return {
	'0x00-ketsu/markdown-preview.nvim',
	dependencies = {
		{
			'nvim-treesitter/nvim-treesitter',
		},
	},
	ft           = { 'md', 'markdown', 'mkd', 'mkdn', 'mdwn', 'mdown', 'mdtxt', 'mdtext', 'rmd', 'wiki' },
	config       = function()
		local markdown_preview = require('markdown-preview')
		markdown_preview.setup {
			term = {
				reload = {
					enable = true,
					events = {
						'BufEnter',
						'InsertLeave',
						'TextChanged',
					},
				},
			},
		}
	end
}
