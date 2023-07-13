require('packer').startup(function (use)
	use {
		'wbthomason/packer.nvim',
	}
	use {
		'f-person/auto-dark-mode.nvim',
		config = function ()
			local auto_dark_mode = require('auto-dark-mode')
			auto_dark_mode.setup {
				update_interval = 500,
			}
			auto_dark_mode.init()
		end
	}
	use {
		'Mofiqul/vscode.nvim',
		config = function ()
			local vscode = require('vscode')
			vscode.setup {
				italic_comments     = true,
				disable_nvimtree_bg = true,
				transparent         = false,
			}
			vscode.load()
		end
	}
	use {
		'0x00-ketsu/markdown-preview.nvim',
		ft = { 'md', 'markdown', 'mkd', 'mkdn', 'mdwn', 'mdown', 'mdtxt', 'mdtext', 'rmd', 'wiki' },
		config = function ()
			local markdown_preview = require('markdown-preview')
			markdown_preview.setup {
				term = {
					reload = {
						enable = true,
						events = {
							'BufEnter',
							'InsertLeave',
							'TextChanged',
						},
					},
				},
			}
		end
	}
	use {
		'windwp/nvim-autopairs',
		config = function ()
			local nvim_autopairs = require('nvim-autopairs')
			nvim_autopairs.setup {
				disable_in_macro = true,
				check_ts         = true,
			}
		end
	}
	use {
		'kevinhwang91/nvim-ufo',
		requires = {
			{ 'kevinhwang91/promise-async' },
		},
		config = function ()
			local ufo, promise = require('ufo'), require('promise')
			local function customizeSelector(bufnr)
				return ufo.getFolds(bufnr, 'lsp')
					:catch(function (err)
						return ufo.getFolds(bufnr, 'treesitter')
					end)
					:catch(function (err)
						return ufo.getFolds(bufnr, 'indent')
					end)
					:catch(function (err)
						return promise.reject(err)
					end)
			end
			ufo.setup {
				provider_selector = function (bufnr, filetype, buftype)
					return customizeSelector
				end
			}
		end
	}
	use {
		'mfussenegger/nvim-dap',
	}
	use {
		'rcarriga/nvim-dap-ui',
		requires = {
			{ 'mfussenegger/nvim-dap' },
		},
		config = function ()
			local dap_ui = require('dapui')
			dap_ui.setup {
			}
		end
	}
	use {
		'williamboman/mason.nvim',
		config = function ()
			local mason = require('mason')
			mason.setup {
			}
		end
	}
	use {
		'williamboman/mason-lspconfig.nvim',
		after = {
			'mason.nvim',
		},
		requires = {
			{ 'williamboman/mason.nvim' },
		},
		config = function ()
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
	use {
		'neovim/nvim-lspconfig',
		after = {
			'mason.nvim',
			'mason-lspconfig.nvim',
		},
		requires = {
			{ 'hrsh7th/cmp-nvim-lsp' },
		},
		config = function ()
			local lsp_config           = require('lspconfig')
			local capabilities         = require('cmp_nvim_lsp')
			local default_capabilities = capabilities.default_capabilities()
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
				cmd          = {'gopls', 'serve'},
				filetypes    = {'go', 'gomod'},
				root_dir     = require('lspconfig/util').root_pattern('go.work', 'go.mod', '.git'),
				settings     = {
					gopls    = {
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
					yaml     = {
						keyOrdering = false,
					},
				},
			}
		end
	}
	use {
		'folke/which-key.nvim',
		config = function ()
			local which_key = require('which-key')
			which_key.setup {
			}
		end
	}
	use {
		'folke/todo-comments.nvim',
		requires = {
			{ 'nvim-lua/plenary.nvim' },
		},
		event  = 'VimEnter',
		config = function ()
			local todo_comments = require('todo-comments')
			todo_comments.setup {
				-- @HACK wait for case-insensitive highlighting
				keywords  = {
					URL  = { icon = ' ', alt = { 'LINK', 'url', 'link' }, color = 'hint' },
					DOC  = { icon = ' ', alt = { 'DOCS', 'doc', 'docs', 'see' }, color = 'info' },
					FIX  = { icon = ' ', alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE', 'fix', 'fixme', 'bug', 'fixit', 'issue' } },
					TODO = { icon = ' ', alt = { 'todo' } },
					HACK = { icon = ' ', alt = { 'hack' } },
					WARN = { icon = ' ', alt = { 'WARNING', 'XXX', 'warn', 'warning', 'xxx' } },
					PERF = { icon = ' ', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE', 'perf', 'optim', 'performance', 'optimize' } },
					NOTE = { icon = ' ', alt = { 'INFO', 'note', 'info' } },
					TEST = { icon = ' ⏲', alt = { 'TESTING', 'PASSED', 'FAILED', 'test', 'testing', 'passed', 'failed' } },
				},
				highlight = {
					before  = '',
					after   = 'fg',
					keyword = 'wide',
					pattern = {
						[[.*<(KEYWORDS)\s*:]], -- default
						[[.*\@(KEYWORDS)\s*]], -- default
						[[.*\\(KEYWORDS)\s*]],
					},
				},
				search = {
					command = 'rg',
					args    = {
						'--color=never',
						'--no-heading',
						'--with-filename',
						'--line-number',
						'--column',
						'--ignore-case',
					},
					-- pattern = [[\b(KEYWORDS):]],  -- default
					-- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon.
					pattern = [[([@|\\](KEYWORDS):?\b)|(\b(KEYWORDS):)]],
				},
			}
		end
	}
	use {
		'folke/trouble.nvim',
		requires = {
			{ 'nvim-tree/nvim-web-devicons' },
		},
		config = function ()
			local trouble = require('trouble')
			trouble.setup {
			}
		end
	}
	use {
		'folke/noice.nvim',
		requires = {
			{ 'MunifTanjim/nui.nvim' },
			{ 'rcarriga/nvim-notify' },
		},
		config = function ()
			local notify = require('notify')
			notify.setup {
				background_colour = 'NotifyBackground',
				fps               = 60,
				icons             = {
					DEBUG = '',
					ERROR = '',
					INFO  = '',
					TRACE = '✎',
					WARN  = '',
				},
				level         = 2,
				minimum_width = 50,
				render        = 'default',
				stages        = 'fade_in_slide_out',
				timeout       = 3000,
				top_down      = false,
			}
			local noice = require('noice')
			noice.setup {
				lsp = {
					override = {
						['vim.lsp.util.convert_input_to_markdown_lines'] = true,
						['vim.lsp.util.stylize_markdown']                = true,
						['cmp.entry.get_documentation']                  = true,
					},
				},
				presets = {
					bottom_search   = false,
					lsp_doc_border  = true,
					command_palette = true,
				},
			}
		end
	}
	use {
		'phaazon/hop.nvim',
		branch = 'v2',
		config = function ()
			local hop = require('hop')
			hop.setup {
			}
		end
	}
	use {
		'numToStr/Comment.nvim',
		config = function ()
			local comment = require('Comment')
			comment.setup {
				ignore = '^(%s*)$',
			}
		end
	}
	use {
		'kylechui/nvim-surround',
		tag = '*',
		config = function ()
			local nvim_surround = require('nvim-surround')
			nvim_surround.setup {
			}
		end
	}
	use {
		'nvim-lualine/lualine.nvim',
		requires = {
			{ 'nvim-tree/nvim-web-devicons' },
		},
		config = function ()
			local lualine = require('lualine')
			lualine.setup {
				options           = {
					icons_enabled        = true,
					theme                = 'vscode',
					component_separators = { left = '', right = '' },
					section_separators   = { left = '', right = '' },
					disabled_filetypes   = {
						statusline = { 'packer', 'NvimTree', 'Outline' },
						winbar     = { 'packer', 'NvimTree', 'Outline' },
					},
					always_divide_middle = true,
					globalstatus         = true,
				},
				sections          = {
					lualine_a = {
						{ 'mode' },
					},
					lualine_b = {
						{ 'branch' },
						{ 'diff' },
						{ 'diagnostics' },
					},
					lualine_c = {
						{ 'filename', path = 3 },
					},
					lualine_x = {
						{ 'encoding' },
						{ 'fileformat' },
						{ 'filetype' },
					},
					lualine_y = {
						{ 'progress' },
					},
					lualine_z = {
						{ 'location' },
					}
				},
				inactive_sections = {
					lualine_a = {
						{ 'mode' },
					},
					lualine_b = {},
					lualine_c = {
						{ 'filename', path = 3 },
					},
					lualine_x = {},
					lualine_y = {
						{ 'progress' },
					},
					lualine_z = {
						{ 'location' },
					}
				},
				tabline           = {
					lualine_a = {
						{ 'tabs', mode = 2 },
					},
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = {
						{ 'buffers', mode = 4 },
					}
				},
				winbar            = {
					-- lualine_a = {},
					-- lualine_b = {},
					-- lualine_c = {},
					-- lualine_x = {},
					-- lualine_y = {},
					-- lualine_z = {}
				},
				inactive_winbar   = {
					-- lualine_a = {},
					-- lualine_b = {},
					-- lualine_c = {},
					-- lualine_x = {},
					-- lualine_y = {},
					-- lualine_z = {}
				},
				extensions        = {
					'fzf',
					'nvim-tree',
					'nvim-dap-ui',
					'symbols-outline',
					'trouble',
				},
			}
		end
	}
	use {
		'nvim-treesitter/nvim-treesitter',
		requires = {
			{ 'nvim-treesitter/nvim-treesitter-context' },
			{ 'nvim-treesitter/nvim-treesitter-refactor' },
			{ 'nvim-treesitter/nvim-treesitter-textobjects' },
		},
		run = ':TSUpdate',
		config = function ()
			local treesitter_configs = require('nvim-treesitter.configs')
			treesitter_configs.setup {
				auto_install     = true,
				ensure_installed = 'all',
				highlight        = {
					enable = true,
				},
				refactor = {
					highlight_definitions   = { enable = true },
					highlight_current_scope = { enable = true },
					smart_rename            = { enable = true },
					navigation              = { enable = true },
				},
				textobjects = {
					select = { enable = true },
					swap   = { enable = false },
					move   = { enable = true },
				},
			}
			local treesitter_context = require('treesitter-context')
			treesitter_context.setup {
			}
		end
	}
	use {
		'nvim-neorg/neorg',
		requires = {
			{ 'nvim-lua/plenary.nvim' },
			{ 'nvim-neorg/neorg-telescope' },
		},
		-- run = ':Neorg sync-parsers',
		after = {
			'nvim-treesitter',
		},
		config = function ()
			local neorg = require('neorg')
			neorg.setup {
				load = {
					['core.defaults']               = {},
					['core.concealer']              = {},
					['core.dirman']                 = {},
					['core.integrations.telescope'] = {},
				},
			}
		end
	}
	use {
		'nvim-orgmode/orgmode',
		requires = {
			{ 'nvim-treesitter/nvim-treesitter' },
		},
		config = function ()
			local orgmode = require('orgmode')
			orgmode.setup_ts_grammar {
			}
			orgmode.setup {
			}
		end
	}
	use {
		'simrat39/symbols-outline.nvim',
		after = {
			'nvim-lspconfig',
		},
		config = function ()
			local symbols_outline = require('symbols-outline')
			symbols_outline.setup {
				highlight_hovered_item = true,
				show_guides            = true,
				auto_preview           = true,
				position               = 'right',
				relative_width         = true,
				width                  = 20,
				auto_close             = false,
				show_numbers           = false,
				show_relative_numbers  = true,
				show_symbol_details    = true,
				preview_bg_highlight   = 'Pmenu',
				keymaps                = { -- These keymaps can be a string or a table for multiple keys
					close          = { '<Esc>', 'q' },
					goto_location  = '<Cr>',
					focus_location = 'o',
					hover_symbol   = '<C-space>',
					toggle_preview = 'K',
					rename_symbol  = 'r',
					code_actions   = 'a',
				},
				lsp_blacklist          = {},
				symbol_blacklist       = {},
				symbols                = {
					File          = { icon = "",    hl = 'TSURI' },
					Module        = { icon = "",    hl = 'TSNamespace' },
					Namespace     = { icon = "",    hl = 'TSNamespace' },
					Package       = { icon = "",    hl = 'TSNamespace' },
					Class         = { icon = "𝓒",    hl = 'TSType' },
					Method        = { icon = "ƒ",    hl = 'TSMethod' },
					Property      = { icon = "",    hl = 'TSMethod' },
					Field         = { icon = "",    hl = 'TSField' },
					Constructor   = { icon = "",    hl = 'TSConstructor' },
					Enum          = { icon = "ℰ",    hl = 'TSType' },
					Interface     = { icon = "ﰮ",    hl = 'TSType' },
					Function      = { icon = "",    hl = 'TSFunction' },
					Variable      = { icon = "",    hl = 'TSConstant' },
					Constant      = { icon = "",    hl = 'TSConstant' },
					String        = { icon = "𝓐",    hl = 'TSString' },
					Number        = { icon = "#",    hl = 'TSNumber' },
					Boolean       = { icon = "⊨",    hl = 'TSBoolean' },
					Array         = { icon = "",    hl = 'TSConstant' },
					Object        = { icon = "⦿",    hl = 'TSType' },
					Key           = { icon = "🔐",   hl = 'TSType' },
					Null          = { icon = "NULL", hl = 'TSType' },
					EnumMember    = { icon = "",    hl = 'TSField' },
					Struct        = { icon = "𝓢",    hl = 'TSType' },
					Event         = { icon = "🗲",    hl = 'TSType' },
					Operator      = { icon = "+",    hl = 'TSOperator' },
					TypeParameter = { icon = "𝙏",    hl = 'TSParameter' },
				},
			}
		end
	}
	use {
		'lukas-reineke/indent-blankline.nvim',
		requires = {
			{ 'nvim-treesitter/nvim-treesitter' },
		},
		config = function ()
			local indent_blankline = require('indent_blankline')
			indent_blankline.setup {
				show_current_context       = true,
				show_current_context_start = true,
				show_end_of_line           = true,
			}
		end
	}
	use {
		'lukas-reineke/headlines.nvim',
		after = {
			'nvim-treesitter',
		},
		requires = {
			{ 'nvim-treesitter/nvim-treesitter' },
		},
		config = function ()
			local headlines = require('headlines')
			headlines.setup {
			}
		end
	}
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-nvim-lsp-signature-help' },
			{ 'hrsh7th/cmp-nvim-lsp-document-symbol' },
			{ 'hrsh7th/cmp-path' },
			{ 'hrsh7th/cmp-cmdline' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-vsnip' },
			{ 'hrsh7th/vim-vsnip' },
		},
		config = function ()
			local cmp, fn = require('cmp'), vim.fn
			cmp.setup {
				experimental = {
					ghost_text = true,
				},
				window  = {
					completion    = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				snippet = {
					expand = function (args)
						fn['vsnip#anonymous'](args.body)
					end,
				},
				mapping = {
					['<CR>']      = cmp.mapping.confirm({ select = true }),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-b>']     = cmp.mapping.scroll_docs(-4),
					['<C-f>']     = cmp.mapping.scroll_docs(4),
					['<C-e>']     = cmp.mapping.abort(),
					['<Tab>']     = function (fallback)
						if cmp.visible() then
							cmp.select_next_item()
						else
							fallback()
						end
					end,
					['<S-Tab>']   = function (fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						else
							fallback()
						end
					end,
				},
				sources = {
					{
						name = 'nvim_lsp',
					},
					{
						name = 'nvim_lsp_signature_help',
					},
					{
						name = 'nvim_lsp_document_symbol',
					},
					{
						name   = 'path',
						option = {
							trailing_slash = true,
						},
					},
					{
						name = 'cmdline',
					},
					{
						name = 'buffer',
					},
					{
						name = 'vsnip'
					},
					{
						name = 'treesitter',
					},
					{
						name = 'orgmode',
					},
					{
						name = 'neorg',
					},
				},
			}
		end
	}
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			{ 'nvim-tree/nvim-web-devicons' },
		},
		config = function ()
			local nvim_tree = require('nvim-tree')
			nvim_tree.setup {
				disable_netrw = true,
				hijack_netrw  = true,
				view          = {
					adaptive_size               = true,
					preserve_window_proportions = true,
					number                      = true,
					relativenumber              = true,
				},
				renderer = {
					add_trailing           = true,
					highlight_git          = true,
					highlight_opened_files = 'all',
					indent_markers         = {
						enable = true,
					},
				},
				update_focused_file = {
					enable     = true,
					update_cwd = true,
				},
				git = {
					ignore  = false,
					timeout = 1000,
				},
				diagnostics = {
					enable       = true,
					show_on_dirs = true,
				},
				modified = {
					enable = true,
				},
				trash = {
					cmd = 'trash',
				},
			}
		end
	}
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			{ 'nvim-lua/plenary.nvim' },
			{ 'nvim-telescope/telescope-file-browser.nvim' },
			{ 'nvim-telescope/telescope-live-grep-args.nvim' },
			{ 'nvim-telescope/telescope-packer.nvim' },
			{ 'nvim-telescope/telescope-dap.nvim' },
		},
		config = function ()
			local telescope = require('telescope')
			telescope.setup {
				defaults   = {
					layout_strategy = 'horizontal',
					layout_config   = {
						horizontal = {
							prompt_position = 'top',
						},
					},
				},
				extensions = {
					file_browser   = {},
					live_grep_args = {},
					packer         = {},
					dap            = {},
					noice          = {},
				},
			}
			telescope.load_extension('file_browser')
			telescope.load_extension('live_grep_args')
			telescope.load_extension('packer')
			telescope.load_extension('dap')
			telescope.load_extension('noice')
		end,
	}
	use {
		'sindrets/diffview.nvim',
		config = function ()
			local diffview = require('diffview')
			diffview.setup {
				enhanced_diff_hl = true,
				view             = {
					defaults     = {
						layout = 'diff2_horizontal',
					},
					merge_tool   = {
						layout = 'diff4_mixed',
					},
					file_history = {
						layout = 'diff2_horizontal',
						winbar_info = true,
					},
				}
			}
		end
	}
	use {
		'lewis6991/gitsigns.nvim',
		requires = {
			{ 'nvim-lua/plenary.nvim' },
		},
		config = function ()
			local gitsigns = require('gitsigns')
			gitsigns.setup {
				signs = {
					add          = { text = '│' },
					change       = { text = '│' },
					delete       = { text = '_' },
					topdelete    = { text = '‾' },
					changedelete = { text = '~' },
					untracked    = { text = '┆' },
				},
				signcolumn   = true,
				numhl        = true,
				linehl       = false,
				word_diff    = true,
				watch_gitdir = {
					interval     = 1000,
					follow_files = true,
				},
				attach_to_untracked          = true,
				current_line_blame           = true,
				current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
				current_line_blame_opts      = {
					virt_text         = true,
					virt_text_pos     = 'eol', -- 'eol' | 'overlay' | 'right_align'
					delay             = 1000,
					ignore_whitespace = false,
				},
				sign_priority    = 6,
				update_debounce  = 100,
				status_formatter = nil, -- Use default
				max_file_length  = 40000,
				preview_config   = {
					border   = 'single',
					style    = 'minimal',
					relative = 'cursor',
					row      = 0,
					col      = 1,
				},
				yadm = {
					enable = false,
				},
			}
		end
	}
end)
