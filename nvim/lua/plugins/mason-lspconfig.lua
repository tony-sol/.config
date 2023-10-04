return {
	'williamboman/mason-lspconfig.nvim',
	priority     = 90,
	dependencies = {
		{
			'williamboman/mason.nvim',
		},
		{
			'neovim/nvim-lspconfig',
		},
	},
	config       = function()
		local mason_lspconfig = require('mason-lspconfig')
		mason_lspconfig.setup {
			automatic_installation = true,
			ensure_installed       = {
				'ansiblels',
				'bashls',
				'clangd',
				'docker_compose_language_service',
				'dockerls',
				'golangci_lint_ls',
				'gopls',
				'graphql',
				'intelephense',
				'jsonls',
				'kotlin_language_server',
				'lua_ls',
				'marksman',
				'omnisharp',
				'pylsp',
				'terraformls',
				'yamlls',
			},
		}
	end
}
