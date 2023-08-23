return {
	'rcarriga/nvim-dap-ui',
	dependencies = {
		{
			'mfussenegger/nvim-dap',
		},
	},
	config = function()
		local dap_ui = require('dapui')
		dap_ui.setup {
		}
	end
}
