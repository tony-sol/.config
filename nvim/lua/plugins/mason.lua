return {
	'williamboman/mason.nvim',
	config = function()
		local utils = require('utils')
		local mason = require('mason')
		mason.setup {
			ui = utils.merge(utils.defaultModalSize(), {
				border = 'rounded',
			})
		}
	end
}
