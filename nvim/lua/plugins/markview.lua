return {
	'OXY2DEV/markview.nvim',
	dependencies = {
		{
			'nvim-tree/nvim-web-devicons',
		},
	},
	ft           = { 'md', 'markdown', 'mkd', 'mkdn', 'mdwn', 'mdown', 'mdtxt', 'mdtext', 'rmd', 'wiki' },
	config       = function()
		local markview = require('markview')
		markview.setup {
		}
	end
}
