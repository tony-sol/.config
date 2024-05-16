return {
	'nvim-tree/nvim-tree.lua',
	dependencies = {
		{
			'nvim-tree/nvim-web-devicons',
		},
	},
	lazy         = false,
	config       = function()
		local utils     = require('utils')
		local nvim_tree = require('nvim-tree')
		nvim_tree.setup {
			disable_netrw       = true,
			hijack_netrw        = true,
			view                = {
				centralize_selection        = true,
				preserve_window_proportions = true,
				number                      = true,
				relativenumber              = true,
				width                       = utils.defaultSidebarSize(),
			},
			renderer            = {
				add_trailing           = true,
				highlight_git          = true,
				highlight_opened_files = 'all',
				highlight_modified     = 'all',
				indent_markers         = {
					enable = true,
					icons  = {
						corner = utils.specialChars().corner.upright,
						edge   = utils.defaultFillchars().vert,
						item   = utils.defaultFillchars().vert,
						bottom = utils.defaultFillchars().horiz,
						none   = utils.defaultFillchars().wbr,
					},
				},
				special_files          = { 'Makefile', 'README.md', 'readme.md' },
				icons                  = {
					git_placement      = 'before',
					modified_placement = 'before',
					glyphs             = {
						modified = '●',
						git      = {
							unmerged  = '',
							deleted   = '',
							renamed   = '󰁕',
							untracked = '',
							ignored   = '',
							unstaged  = '󰄱',
							staged    = '',
						},
					},
				},
			},
			hijack_directories  = {
				enable    = true,
				auto_open = true,
			},
			update_focused_file = {
				enable      = true,
				update_root = true,
				ignore_list = {},
			},
			diagnostics         = {
				enable            = true,
				show_on_dirs      = true,
				show_on_open_dirs = true,
			},
			filters             = {
				git_ignored = false,
				dotfiles    = false,
				git_clean   = false,
				no_buffer   = false,
				custom      = {},
				exclude     = {},
			},
			modified            = {
				enable            = true,
				show_on_dirs      = true,
				show_on_open_dirs = true,
			},
			trash               = {
				cmd = 'trash',
			},
			experimental        = {},
		}
	end
}
