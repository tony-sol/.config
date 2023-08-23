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
	config = function()
		local lsp_config                               = require('lspconfig')
		local capabilities                             = require('cmp_nvim_lsp')
		local default_capabilities                     = capabilities.default_capabilities()
		default_capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly     = true,
		}
		lsp_config.ansiblels.setup {
			capabilities = default_capabilities,
		}
		lsp_config.bashls.setup {
			capabilities = default_capabilities,
		}
		lsp_config.clangd.setup {
			capabilities = default_capabilities,
		}
		lsp_config.docker_compose_language_service.setup {
			capabilities = default_capabilities,
		}
		lsp_config.dockerls.setup {
			capabilities = default_capabilities,
		}
		lsp_config.golangci_lint_ls.setup {
			capabilities = default_capabilities,
		}
		lsp_config.gopls.setup {
			capabilities = default_capabilities,
			cmd          = { 'gopls', 'serve' },
			filetypes    = { 'go', 'gomod' },
			root_dir     = require('lspconfig/util').root_pattern('go.work', 'go.mod', '.git'),
			settings     = {
				gopls = {
					analyses = {
						unusedparams = true,
					},
					staticcheck = true,
				},
			},
		}
		lsp_config.graphql.setup {
			capabilities = default_capabilities,
		}
		lsp_config.intelephense.setup {
			capabilities = default_capabilities,
		}
		lsp_config.jsonls.setup {
			capabilities = default_capabilities,
		}
		lsp_config.kotlin_language_server.setup {
			capabilities = default_capabilities,
		}
		lsp_config.lua_ls.setup {
			capabilities = default_capabilities,
			settings     = {
				Lua = {
					diagnostics = {
						globals = { 'vim' },
					},
				}
			},
		}
		lsp_config.marksman.setup {
			capabilities = default_capabilities,
		}
		lsp_config.omnisharp.setup {
			capabilities = default_capabilities,
		}
		lsp_config.pylsp.setup {
			capabilities = default_capabilities,
		}
		lsp_config.terraformls.setup {
			capabilities = default_capabilities,
		}
		lsp_config.yamlls.setup {
			capabilities = default_capabilities,
			settings     = {
				yaml = {
					keyOrdering = false,
				},
			},
		}
	end
}
