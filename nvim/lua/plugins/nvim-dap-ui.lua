return {
	'rcarriga/nvim-dap-ui',
	event        = 'VeryLazy',
	dependencies = {
		{
			'mfussenegger/nvim-dap',
		},
		{
			'nvim-neotest/nvim-nio',
		},
	},
	config       = function()
		local dap_ui = require('dapui')
		dap_ui.setup {
		}
	end
}
