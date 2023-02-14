local cmd    = vim.cmd -- execute Vim commands
local g      = vim.g -- global variables
local opt    = vim.opt -- global/buffer/windows-scoped
local keymap = vim.keymap -- keymaps
local api    = vim.api -- API
local fn     = vim.fn -- functions

opt.listchars:append('space:⋅')
opt.termguicolors  = true
opt.signcolumn     = 'yes'
opt.updatetime     = 100
opt.list           = true
opt.cursorline     = true
opt.number         = true
opt.relativenumber = true
opt.tabstop        = 4
opt.softtabstop    = 0
opt.shiftwidth     = 4
opt.smarttab       = true
opt.smartcase      = true
opt.smartindent    = true
opt.hlsearch       = true
opt.splitright     = true

g.mapleader            = '\\'
g.maplocalleader       = '\\'
g.loaded_perl_provider = 0

keymap.set({ 'n', 'v' }, ']b', '<plug>(CybuNext)')
keymap.set({ 'n', 'v' }, '[b', '<plug>(CybuPrev)')

cmd([[packadd packer.nvim]])
cmd([[colorscheme vscode]])

api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function(data)
		if fn.isdirectory(data.file) ~= 1 then
			return
		end
		cmd.cd(data.file)
		require("nvim-tree.api").tree.open()
	end
})
-- @todo Fix autoclose - respect opened buffers,tabs and windows
-- api.nvim_create_autocmd({ "BufEnter" }, {
-- 	nested = true,
-- 	callback = function()
-- 		if #api.nvim_list_tabpages() == 1 and
-- 			#api.nvim_list_wins() == 0 and
-- 			require("nvim-tree.utils").is_nvim_tree_buf()
-- 		then
-- 			cmd([[quit]])
-- 		end
-- 	end
-- })

return require('packer').startup(function(use)
	use {
		'wbthomason/packer.nvim',
	}
	use {
		'nvim-lua/plenary.nvim',
	}
	use {
		'Mofiqul/vscode.nvim',
		require('vscode').setup {
			italic_comments     = true,
			disable_nvimtree_bg = true,
			transparent         = true,
		},
	}
	use {
		'stevearc/dressing.nvim',
	}
	use {
		"ellisonleao/glow.nvim",
		require("glow").setup{
			border       = "none",
			width_ratio  = 0.8,
			height_ratio = 0.8,
		},
	}
	use {
		'windwp/nvim-autopairs',
		require('nvim-autopairs').setup {
			disable_in_macro = true,
			check_ts         = true,
		},
	}
	use {
		'mfussenegger/nvim-dap',
	}
	use {
		'rcarriga/nvim-dap-ui',
		require('dapui').setup {
		},
	}
	use {
		'williamboman/mason.nvim',
		require('mason').setup {
		},
	}
	use {
		'williamboman/mason-lspconfig.nvim',
		require('mason-lspconfig').setup {
			automatic_installation = true,
			ensure_installed       = {
				'ansiblels',
				'bashls',
				'clangd',
				'dockerls',
				'golangci_lint_ls',
				'gopls',
				'graphql',
				'intelephense',
				'jsonls',
				'lua_ls',
				'marksman',
				'omnisharp',
				'pylsp',
				'terraformls',
				'yamlls',
			},
		},
	}
	use {
		'neovim/nvim-lspconfig',
		config = function()
			require('lspconfig').ansiblels.setup {}
			require('lspconfig').bashls.setup {}
			require('lspconfig').clangd.setup {}
			require('lspconfig').dockerls.setup {}
			require('lspconfig').golangci_lint_ls.setup {}
			require('lspconfig').gopls.setup {}
			require('lspconfig').graphql.setup {}
			require('lspconfig').intelephense.setup {}
			require('lspconfig').jsonls.setup {}
			require('lspconfig').lua_ls.setup {}
			require('lspconfig').marksman.setup {}
			require('lspconfig').omnisharp.setup {}
			require('lspconfig').pylsp.setup {}
			require('lspconfig').terraformls.setup {}
			require('lspconfig').yamlls.setup {}
		end
	}
	use {
		'folke/which-key.nvim',
		require('which-key').setup {
		},
	}
	use { -- @BREAKING Intro screen
		'folke/todo-comments.nvim',
		require('todo-comments').setup {
		},
	}
	use {
		'folke/lsp-colors.nvim',
		require('lsp-colors').setup {
		},
	}
	use {
		'folke/trouble.nvim',
		require('trouble').setup {
		},
	}
	use {
		'phaazon/hop.nvim',
		require('hop').setup {
		},
	}
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}
	use {
		'kylechui/nvim-surround',
		require('nvim-surround').setup {
		},
	}
	use { -- @BREAKING Intro screen
		'nvim-lualine/lualine.nvim',
		requires = {
			'kyazdani42/nvim-web-devicons'
		},
		require('lualine').setup {
			options           = {
				icons_enabled        = true,
				theme                = 'vscode',
				component_separators = { left = '', right = '' },
				section_separators   = { left = '', right = '' },
				disabled_filetypes   = {
					statusline = { 'packer', 'NvimTree', 'Outline' },
					winbar     = { 'packer', 'NvimTree', 'Outline' }
				},
				always_divide_middle = true,
				globalstatus         = false
			},
			sections          = {
				lualine_a = {
					{ 'mode' }
				},
				lualine_b = {
					{ 'branch' },
					{ 'diff' },
					{ 'diagnostics' }
				},
				lualine_c = {
					{ 'filename', path = 3 }
				},
				lualine_x = {
					{ 'encoding' },
					{ 'fileformat' },
					{ 'filetype' }
				},
				lualine_y = {
					{ 'progress' }
				},
				lualine_z = {
					{ 'location' }
				}
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					{ 'filename' }
				},
				lualine_x = {
					{ 'location' }
				},
				lualine_y = {},
				lualine_z = {}
			},
			tabline           = {
				lualine_a = {
					{ 'tabs', mode = 2 }
				},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {
					{ 'buffers', mode = 4 }
				}
			},
			winbar            = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {
					{ 'windows', mode = 2, disabled_buftypes = { 'nofile' } }
				}
			},
			inactive_winbar   = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {
					{ 'windows', mode = 2, disabled_buftypes = { 'nofile' } }
				}
			},
			extensions        = {
				'nvim-tree',
				'nvim-dap-ui',
				'symbols-outline',
			},
		},
	}
	use {
		'nvim-treesitter/nvim-treesitter',
		requires = {
			'nvim-treesitter/nvim-treesitter-refactor'
		},
		run = ':TSUpdate',
		require('nvim-treesitter.configs').setup {
			ensure_installed = 'all',
			ignore_install   = {
				'phpdoc',
			},
			highlight        = {
				enable = true,
			},
			refactor         = {
				highlight_definitions   = { enable = true },
				highlight_current_scope = { enable = false },
				smart_rename            = { enable = true },
			},
		},
	}
	use {
		'nvim-treesitter/nvim-treesitter-context',
		require('treesitter-context').setup {
		},
	}
	use {
		'simrat39/symbols-outline.nvim',
		-- after = 'nvim-lspconfig',
		require('symbols-outline').setup {
			highlight_hovered_item = true,
			show_guides            = true,
			auto_preview           = true,
			position               = 'right',
			relative_width         = true,
			width                  = 20,
			auto_close             = false,
			show_numbers           = false,
			show_relative_numbers  = false,
			show_symbol_details    = true,
			preview_bg_highlight   = 'Pmenu',
			keymaps                = { -- These keymaps can be a string or a table for multiple keys
				close          = { "<Esc>", "q" },
				goto_location  = "<Cr>",
				focus_location = "o",
				hover_symbol   = "<C-space>",
				toggle_preview = "K",
				rename_symbol  = "r",
				code_actions   = "a",
			},
			lsp_blacklist          = {},
			symbol_blacklist       = {},
			symbols                = {
				File          = { icon = "", hl = "TSURI" },
				Module        = { icon = "", hl = "TSNamespace" },
				Namespace     = { icon = "", hl = "TSNamespace" },
				Package       = { icon = "", hl = "TSNamespace" },
				Class         = { icon = "𝓒", hl = "TSType" },
				Method        = { icon = "ƒ", hl = "TSMethod" },
				Property      = { icon = "", hl = "TSMethod" },
				Field         = { icon = "", hl = "TSField" },
				Constructor   = { icon = "", hl = "TSConstructor" },
				Enum          = { icon = "ℰ", hl = "TSType" },
				Interface     = { icon = "ﰮ", hl = "TSType" },
				Function      = { icon = "", hl = "TSFunction" },
				Variable      = { icon = "", hl = "TSConstant" },
				Constant      = { icon = "", hl = "TSConstant" },
				String        = { icon = "𝓐", hl = "TSString" },
				Number        = { icon = "#", hl = "TSNumber" },
				Boolean       = { icon = "⊨", hl = "TSBoolean" },
				Array         = { icon = "", hl = "TSConstant" },
				Object        = { icon = "⦿", hl = "TSType" },
				Key           = { icon = "🔐", hl = "TSType" },
				Null          = { icon = "NULL", hl = "TSType" },
				EnumMember    = { icon = "", hl = "TSField" },
				Struct        = { icon = "𝓢", hl = "TSType" },
				Event         = { icon = "🗲", hl = "TSType" },
				Operator      = { icon = "+", hl = "TSOperator" },
				TypeParameter = { icon = "𝙏", hl = "TSParameter" },
			},
		},
	}
	use {
		'lukas-reineke/indent-blankline.nvim',
		requires = {
			'nvim-treesitter/nvim-treesitter',
		},
		require('indent_blankline').setup {
			show_current_context       = true,
			show_current_context_start = true,
		},
	}
	use {
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-buffer',
	}
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-buffer',
		},
		require('cmp').setup {
			mapping = {
				['<Tab>'] = function(fallback)
					if require('cmp').visible() then
						require('cmp').select_next_item()
					else
						fallback()
					end
				end,
				['<S-Tab>'] = function(fallback)
					if require('cmp').visible() then
						require('cmp').select_prev_item()
					else
						fallback()
					end
				end,
				['<CR>'] = require('cmp').mapping.confirm {
					behavior = require('cmp').ConfirmBehavior.Replace,
					select   = true,
				},
			},
			sources = {
				{
					name   = 'path',
					option = {
						trailing_slash = true,
					},
				},
				{
					name = 'buffer',
				},
			},
		},
	}
	use {
		'kyazdani42/nvim-web-devicons',
	}
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons',
		},
		require('nvim-tree').setup {
			disable_netrw       = true,
			hijack_netrw        = false,
			view                = {
				adaptive_size               = true,
				preserve_window_proportions = true,
				number                      = true,
				relativenumber              = true,
			},
			renderer            = {
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
			git                 = {
				ignore = false,
			},
			diagnostics         = {
				enable       = true,
				show_on_dirs = true,
			},
			trash               = {
				cmd = 'trash',
			},
		}
	}
	use {
		'ghillb/cybu.nvim',
		requires = {
			'kyazdani42/nvim-web-devicons',
			'nvim-lua/plenary.nvim',
		},
		require('cybu').setup {
			style        = {
				hide_buffer_id = false,
			},
			display_time = 1000,
		},
	}
	use {
		'nvim-telescope/telescope-file-browser.nvim',
		'nvim-telescope/telescope-live-grep-args.nvim',
		'nvim-telescope/telescope-packer.nvim',
		'nvim-telescope/telescope-dap.nvim',
	}
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope-file-browser.nvim',
			'nvim-telescope/telescope-live-grep-args.nvim',
			'nvim-telescope/telescope-packer.nvim',
			'nvim-telescope/telescope-dap.nvim',
		},
		require('telescope').setup {
			defaults   = {
				layout_strategy = 'vertical',
			},
			extensions = {
				file_browser   = {
					hijack_netrw = false,
				},
				live_grep_args = {},
				packer         = {},
				dap            = {},
			},
		},
		require('telescope').load_extension('file_browser'),
		require('telescope').load_extension('live_grep_args'),
		require('telescope').load_extension('packer'),
		require('telescope').load_extension('dap'),
	}
	use {
		'lewis6991/gitsigns.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
		},
		config = function()
			require('gitsigns').setup {
				signs                             = {
					add          = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
					change       = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
					delete       = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
					topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
					changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
				},
				signcolumn                        = true, -- Toggle with `:Gitsigns toggle_signs`
				numhl                             = true, -- Toggle with `:Gitsigns toggle_numhl`
				linehl                            = false, -- Toggle with `:Gitsigns toggle_linehl`
				word_diff                         = true, -- Toggle with `:Gitsigns toggle_word_diff`
				keymaps                           = {
					-- Default keymap options
					noremap = true,

					['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'" },
					['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'" },

					['n <leader>hs'] = '<cmd>Gitsigns stage_hunk<CR>',
					['v <leader>hs'] = ':Gitsigns stage_hunk<CR>',
					['n <leader>hu'] = '<cmd>Gitsigns undo_stage_hunk<CR>',
					['n <leader>hr'] = '<cmd>Gitsigns reset_hunk<CR>',
					['v <leader>hr'] = ':Gitsigns reset_hunk<CR>',
					['n <leader>hR'] = '<cmd>Gitsigns reset_buffer<CR>',
					['n <leader>hp'] = '<cmd>Gitsigns preview_hunk<CR>',
					['n <leader>hb'] = '<cmd>lua require("gitsigns").blame_line{full=true}<CR>',
					['n <leader>hS'] = '<cmd>Gitsigns stage_buffer<CR>',
					['n <leader>hU'] = '<cmd>Gitsigns reset_buffer_index<CR>',

					-- Text objects
					['o ih'] = ':<C-U>Gitsigns select_hunk<CR>',
					['x ih'] = ':<C-U>Gitsigns select_hunk<CR>',
				},
				watch_gitdir                      = {
					interval     = 1000,
					follow_files = true,
				},
				attach_to_untracked               = true,
				current_line_blame                = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
				current_line_blame_opts           = {
					virt_text         = true,
					virt_text_pos     = 'eol', -- 'eol' | 'overlay' | 'right_align'
					delay             = 1000,
					ignore_whitespace = false,
				},
				current_line_blame_formatter_opts = {
					relative_time = false,
				},
				sign_priority                     = 6,
				update_debounce                   = 100,
				status_formatter                  = nil, -- Use default
				max_file_length                   = 40000,
				preview_config                    = {
					border   = 'single',
					style    = 'minimal',
					relative = 'cursor',
					row      = 0,
					col      = 1,
				},
				yadm                              = {
					enable = false,
				},
			}
		end
	}
end)
