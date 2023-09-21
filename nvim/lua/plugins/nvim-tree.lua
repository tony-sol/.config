return {
	'nvim-tree/nvim-tree.lua',
	lazy         = false,
	dependencies = {
		{
			'nvim-tree/nvim-web-devicons',
		},
	},
	config       = function()
		local nvim_tree = require('nvim-tree')
		nvim_tree.setup {
			disable_netrw       = true,
			hijack_netrw        = true,
			view                = {
				preserve_window_proportions = true,
				number                      = true,
				relativenumber              = true,
				width                       = {
					min     = 30,
					max     = -1,
					padding = 1,
				},
			},
			renderer            = {
				add_trailing           = true,
				highlight_git          = true,
				highlight_opened_files = 'all',
				highlight_modified     = 'all',
				indent_markers         = {
					enable = true,
				},
				special_files          = { 'Makefile', 'README.md', 'readme.md' },
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
