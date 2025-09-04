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
				'docker_language_server',
				'docker_compose_language_service',
				'dockerls',
				'gitlab_ci_ls',
				'golangci_lint_ls',
				'gopls',
				'graphql',
				'helm_ls',
				'intelephense',
				'jsonls',
				'kotlin_lsp',
				'lemminx',
				'lua_ls',
				'marksman',
				'omnisharp',
				'pylsp',
				'rubocop',
				'rust_analyzer',
				'terraformls',
				'tflint',
				'yamlls',
			},
		}
	end
}
