return {
	'lukas-reineke/headlines.nvim',
	dependencies = {
		{
			'nvim-treesitter/nvim-treesitter',
		},
	},
	config = function()
		local headlines = require('headlines')
		headlines.setup {
		}
	end
}
