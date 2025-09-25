return {
	'neovim/nvim-lspconfig',
	dependencies = {
		{
			'hrsh7th/cmp-nvim-lsp',
		},
		{
			'williamboman/mason.nvim',
		},
		{
			'williamboman/mason-lspconfig.nvim',
		},
	},
	config       = function()
		---@diagnostic disable: undefined-global
		local lsp          = vim.lsp
		---@diagnostic enable: undefined-global
		local utils        = require('utils')
		-- @todo consider switch to vim.lsp.protocol.make_client_capabilities()
		local capabilities = require('cmp_nvim_lsp').default_capabilities()
		capabilities       = utils.merge(capabilities, {
			textDocument = {
				completion = {
					dynamicRegistration = true,
				},
				foldingRange = {
					dynamicRegistration = false,
					lineFoldingOnly     = true,
				},
				semanticTokens = {
					multilineTokenSupport = true,
				},
			},
		})
		lsp.config('*', {
			capabilities = capabilities
		})
		lsp.config('gopls', {
			capabilities = capabilities,
			settings     = {
				gopls = {
					analyses = {
						unusedparams = true,
					},
					staticcheck = true,
				},
			},
		})
		lsp.config('yamlls', {
			capabilities = capabilities,
			settings     = {
				yaml = {
					keyOrdering = false,
				},
			},
		})
		-- @todo call vim.lsp.enable(lsp_name)
	end
}
