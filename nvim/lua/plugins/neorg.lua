return {
	'nvim-neorg/neorg',
	dependencies = {
		{
			'nvim-lua/plenary.nvim',
		},
		{
			'nvim-neorg/neorg-telescope',
		},
	},
	build = ':Neorg sync-parsers',
	config = function ()
		local neorg = require('neorg')
		neorg.setup {
			load = {
				['core.defaults']               = {},
				['core.concealer']              = {},
				['core.dirman']                 = {},
				['core.integrations.telescope'] = {},
			},
		}
	end
}
