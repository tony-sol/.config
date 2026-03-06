local utils = require('utils')

return {
	'ramilito/kubectl.nvim',
	dependencies = {
		{
			'saghen/blink.download',
		},
	},
	event        = 'VimEnter',
	opts         = {
		diff = {
			bin = nil,
		},
		float_size = utils.defaultModalSize(),
	}
}
