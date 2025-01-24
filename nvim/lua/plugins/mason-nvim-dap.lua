return {
	'williamboman/mason-nvim-dap.nvim',
	dependencies = {
		{
			'williamboman/mason.nvim',
		},
		{
			'mfussenegger/nvim-dap',
		},
	},
	config       = function()
		local mason_dap = require('mason-nvim-dap')
		mason_dap.setup {
			automatic_installation = true,
			ensure_installed       = {
				'debugpy',
				'delve',
				'kotlin-debug-adapter',
			},
		}
	end
}
