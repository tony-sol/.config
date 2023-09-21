return {
	'sindrets/diffview.nvim',
	event  = 'VeryLazy',
	config = function()
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
					layout      = 'diff2_horizontal',
					winbar_info = true,
				},
			}
		}
	end
}
