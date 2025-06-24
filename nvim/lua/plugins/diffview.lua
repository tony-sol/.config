return {
	'sindrets/diffview.nvim',
	event = 'VeryLazy',
	opts  = {
		enhanced_diff_hl = true,
		view             = {
			default      = {
				layout = 'diff2_horizontal',
				winbar_info = true,
			},
			merge_tool   = {
				layout = 'diff4_mixed',
			},
			file_history = {
				layout      = 'diff2_horizontal',
				winbar_info = true,
			},
		},
	},
}
