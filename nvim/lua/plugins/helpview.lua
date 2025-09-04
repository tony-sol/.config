return {
	'OXY2DEV/helpview.nvim',
	priority     = 49,
	dependencies = {
		{
			'nvim-tree/nvim-web-devicons',
		},
	},
	config       = function()
		local helpview = require('helpview')
		helpview.setup {
		}
	end
}
