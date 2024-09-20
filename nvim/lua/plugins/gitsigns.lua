return {
	'lewis6991/gitsigns.nvim',
	dependencies = {
		{
			'nvim-lua/plenary.nvim',
		},
	},
	config       = function()
		local fchars   = require('utils').defaultFillchars()
		local schars   = require('utils').specialChars()
		local gitsigns = require('gitsigns')
		gitsigns.setup {
			signs                        = {
				add          = { text = fchars.vert },
				change       = { text = fchars.vert },
				changedelete = { text = fchars.eob },
				delete       = { text = schars.bottom },
				topdelete    = { text = schars.top },
				untracked    = { text = schars.dashed.vert },
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
				virt_text_pos     = 'right_align', -- 'eol' | 'overlay' | 'right_align'
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
		}
	end
}
