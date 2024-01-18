return {
	'lewis6991/gitsigns.nvim',
	dependencies = {
		{
			'nvim-lua/plenary.nvim',
		},
	},
	config       = function()
		local gitsigns = require('gitsigns')
		local utils    = require('utils')
		gitsigns.setup {
			signs                        = {
				add          = { text = utils.defaultFillchars().vert },
				change       = { text = utils.defaultFillchars().vert },
				delete       = { text = utils.extraFillchars().bottom },
				topdelete    = { text = utils.extraFillchars().top },
				changedelete = { text = utils.defaultFillchars().eob },
				untracked    = { text = utils.extraFillchars().vertdashed },
			},
			signcolumn                   = true,
			numhl                        = true,
			linehl                       = false,
			word_diff                    = true,
			watch_gitdir                 = {
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
			sign_priority                = 6,
			update_debounce              = 100,
			status_formatter             = nil, -- Use default
			max_file_length              = 40000,
			preview_config               = {
				border   = 'single',
				style    = 'minimal',
				relative = 'cursor',
				row      = 0,
				col      = 1,
			},
			yadm                         = {
				enable = false,
			},
		}
	end
}
