return {
	'ramilito/kubectl.nvim',
	config = function()
		local utils   = require('utils')
		local kubectl = require('kubectl')
		kubectl.setup {
			diff = {
				bin = '',
			},
			float_size = utils.defaultModalSize(),
		}
	end
}