return {
	'ramilito/kubectl.nvim',
	dependencies = {
		{
			'saghen/blink.download',
		},
	},
	event  = 'VimEnter',
	config = function()
		local utils   = require('utils')
		local kubectl = require('kubectl')
		kubectl.setup {
			diff = {
				bin = nil,
			},
			float_size = utils.defaultModalSize(),
		}
	end
}
