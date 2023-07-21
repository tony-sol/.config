return {
	'nvim-tree/nvim-tree.lua',
	dependencies = {
		{
			'nvim-tree/nvim-web-devicons',
		},
	},
	config = function ()
		local nvim_tree = require('nvim-tree')
		nvim_tree.setup {
			disable_netrw = false,
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
