vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	use {
		'wbthomason/packer.nvim'
	}
	use {
		'windwp/nvim-autopairs',
		require('nvim-autopairs').setup {}
	}
	use {
		'williamboman/nvim-lsp-installer',
		config = function()
			require('nvim-lsp-installer').setup {
				automatic_installation = true,
				ensure_installed       = {
					'sumneko_lua',
					'gopls'
				}
			}
		end
	}
	use {
		'neovim/nvim-lspconfig',
		config = function()
			require('lspconfig').sumneko_lua.setup {}
			require('lspconfig').gopls.setup {}
		end
	}
	use {
		'folke/which-key.nvim',
		require('which-key').setup {}
	}
	use {
		'numToStr/Comment.nvim',
		require('Comment').setup {}
	}
	use {
		'Mofiqul/vscode.nvim'
	}
	use {
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
				disabled_filetypes   = {},
				always_divide_middle = true,
				globalstatus         = false
			},
			sections          = {
				lualine_a = { 'mode' },
				lualine_b = { 'branch', 'diff', 'diagnostics' },
				lualine_c = { 'filename' },
				lualine_x = { 'encoding', 'fileformat', 'filetype' },
				lualine_y = { 'progress' },
				lualine_z = { 'location' }
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { 'filename' },
				lualine_x = { 'location' },
				lualine_y = {},
				lualine_z = {}
			},
			tabline           = {
				lualine_a = { 'windows' },
				lualine_b = { 'tabs' }
			},
			extensions        = {}
		}
	}
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		require('nvim-treesitter.configs').setup {
			ensure_installed = 'all',
			highlight        = {
				enable = true
			}
		}
	}
	use {
		'simrat39/symbols-outline.nvim',
		-- after = 'nvim-lspconfig',
		config = function()
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
					TypeParameter = { icon = "𝙏", hl = "TSParameter" }
				}
			}
		end
	}
	use {
		'lukas-reineke/indent-blankline.nvim',
		requires = {
			'nvim-treesitter/nvim-treesitter'
		},
		require('indent_blankline').setup {
			show_current_context       = true,
			show_current_context_start = true
		}
	}
	use {
		'hrsh7th/nvim-cmp', -- completion
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
					select   = true
				}
			},
			sources = {
				{
					name   = 'path',
					option = {
						trailing_slash = true
					}
				},
				{
					name = 'buffer'
				}
			}
		}
	}
	use {
		'hrsh7th/cmp-path',
		requires = {
			'hrsh7th/nvim-cmp'
		}
	}
	use {
		'hrsh7th/cmp-buffer',
		requires = {
			'hrsh7th/nvim-cmp'
		}
	}
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons' -- optional, for file icon
		},
		require('nvim-tree').setup {
			auto_reload_on_write               = true,
			disable_netrw                      = false,
			hijack_cursor                      = false,
			hijack_netrw                       = true,
			hijack_unnamed_buffer_when_opening = false,
			ignore_buffer_on_setup             = false,
			open_on_setup                      = false,
			open_on_setup_file                 = false,
			open_on_tab                        = false,
			sort_by                            = 'name',
			update_cwd                         = false,
			view                               = {
				width                       = 30,
				height                      = 30,
				hide_root_folder            = false,
				side                        = 'left',
				preserve_window_proportions = false,
				number                      = false,
				relativenumber              = false,
				signcolumn                  = 'yes',
				mappings                    = {
					custom_only = false,
					list = {
						--	user mappings go here
					}
				}
			},
			renderer                           = {
				indent_markers = {
					enable = true,
					icons = {
						corner = '└ ',
						edge   = '│ ',
						none   = '  '
					}
				},
				icons = {
					webdev_colors = true,
					git_placement = 'before'
				}
			},
			hijack_directories                 = {
				enable    = true,
				auto_open = true
			},
			update_focused_file                = {
				enable      = false,
				update_cwd  = false,
				ignore_list = {}
			},
			ignore_ft_on_setup                 = {},
			system_open                        = {
				cmd  = '',
				args = {}
			},
			diagnostics                        = {
				enable       = false,
				show_on_dirs = false,
				icons        = {
					hint    = '',
					info    = '',
					warning = '',
					error   = ''
				}
			},
			filters                            = {
				dotfiles = false,
				custom   = {},
				exclude  = {}
			},
			git                                = {
				enable  = true,
				ignore  = false,
				timeout = 400
			},
			actions                            = {
				use_system_clipboard = true,
				change_dir = {
					enable             = true,
					global             = false,
					restrict_above_cwd = false
				},
				open_file = {
					quit_on_open  = false,
					resize_window = false,
					window_picker = {
						enable  = true,
						chars   = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890',
						exclude = {
							filetype = { 'notify', 'packer', 'qf', 'diff', 'fugitive', 'fugitiveblame' },
							buftype  = { 'nofile', 'terminal', 'help' }
						}
					}
				}
			},
			trash                              = {
				cmd             = 'trash',
				require_confirm = true
			},
			log                                = {
				enable   = false,
				truncate = false,
				types    = {
					all         = false,
					config      = false,
					copy_paste  = false,
					diagnostics = false,
					git         = false,
					profile     = false
				}
			}
		}
	}
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/plenary.nvim'
		}
	}
	use {
		'lewis6991/gitsigns.nvim',
		requires = {
			'nvim-lua/plenary.nvim'
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
					['x ih'] = ':<C-U>Gitsigns select_hunk<CR>'
				},
				watch_gitdir                      = {
					interval     = 1000,
					follow_files = true
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
					relative_time = false
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
					col      = 1
				},
				yadm                              = {
					enable = false
				}
			}
		end
	}
end)
