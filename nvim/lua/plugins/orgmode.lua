return {
	'nvim-orgmode/orgmode',
	dependencies = {
		{
			'nvim-treesitter/nvim-treesitter',
		},
	},
	config = function ()
		local orgmode = require('orgmode')
		orgmode.setup_ts_grammar {
		}
		orgmode.setup {
		}
	end
}
