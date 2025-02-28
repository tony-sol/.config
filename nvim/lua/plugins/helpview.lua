return {
	'OXY2DEV/helpview.nvim',
	dependencies = {
		{
			'nvim-tree/nvim-web-devicons',
		},
	},
	lazy         = false,
	config       = function()
		local helpview = require('helpview')
		helpview.setup {
		}
	end
}
