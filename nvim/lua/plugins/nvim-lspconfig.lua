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
		local fn                   = vim.fn
		local fs                   = vim.fs
		---@diagnostic enable: undefined-global
		local lsp_config           = require('lspconfig')
		local lsp_config_util      = require('lspconfig/util')
		local capabilities         = require('cmp_nvim_lsp')
		local default_capabilities = capabilities.default_capabilities({
			dynamicRegistration = true,
		})
		default_capabilities       = {
			textDocument = {
				foldingRange = {
					dynamicRegistration = false,
					lineFoldingOnly     = true,
				}
			}
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
			root_dir     = lsp_config_util.root_pattern('go.work', 'go.mod', '.git'),
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
			---@diagnostic disable-next-line: unused-local
			before_init  = function(params, config)
				-- @todo get workspace hash and join to bases storagePath
				-- config.init_options.storagePath = fs.joinpath(
				-- 	config.init_options.storagePath,
				-- 	'' -- config.root_dir
				-- )
				_ = fn.isdirectory(config.init_options.storagePath) ~= 0
					or fn.mkdir(config.init_options.storagePath, 'p')
			end,
			init_options = {
				storagePath = fs.joinpath(fn.stdpath('state'), '/fwcd.kotlin')
			},
		}
		lsp_config.lua_ls.setup {
			capabilities = default_capabilities,
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
		lsp_config.rubocop.setup {
			capabilities = default_capabilities,
		}
		lsp_config.rust_analyzer.setup {
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
