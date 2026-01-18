local utils = require('utils')

return {
	'williamboman/mason.nvim',
	opts = {
		ui = utils.merge(utils.defaultModalSize(), {
			border = 'rounded',
		})
	}
}
