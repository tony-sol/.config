return {
	'folke/todo-comments.nvim',
	dependencies = {
		{
			'nvim-lua/plenary.nvim',
		},
		{
			'ibhagwan/fzf-lua',
		},
	},
	event        = 'VimEnter',
	config       = function()
		local todo_comments = require('todo-comments')
		local keywords      = {
			URL  = {
				icon = '', color = 'hint', alt = { 'LINK' }
			},
			DOC  = {
				icon = '', color = 'info', alt = { 'DOCS', 'SEE' }
			},
			FIX  = {
				icon = '', color = 'error', alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' }
			},
			TODO = {
				icon = '', color = 'info', alt = {}
			},
			HACK = {
				icon = '', color = 'warning', alt = {}
			},
			WARN = {
				icon = '', color = 'warning', alt = { 'WARNING', 'XXX' }
			},
			PERF = {
				icon = '', color = 'default', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' }
			},
			NOTE = {
				icon = '', color = 'hint', alt = { 'INFO' }
			},
			TEST = {
				icon = '', color = 'test', alt = { 'TESTING', 'PASSED', 'FAILED' },
			},
		}
		for key, val in pairs(keywords) do
			local alt_lower = { key:sub(1, 1):upper() .. key:sub(2):lower(), key:lower() }
			for _, alt in pairs(val.alt) do
				table.insert(alt_lower, alt:sub(1, 1):upper() .. alt:sub(2):lower())
				table.insert(alt_lower, alt:lower())
			end
			for _, alt in pairs(alt_lower) do
				table.insert(val.alt, alt)
			end
		end
		todo_comments.setup {
			keywords  = keywords,
			gui_style = {
				fg = 'bold',
				bg = 'bold',
			},
			highlight = {
				multiline = false,
				before    = '',
				after     = 'fg',
				keyword   = 'wide_fg',
				pattern   = {
					[[\@(KEYWORDS)]],
					[[\@(KEYWORDS)\s*:]],
					[[\s(KEYWORDS)\s*:]],
				},
			},
			search    = {
				command = 'rg',
				args    = {
					'--color=never',
					'--no-heading',
					'--with-filename',
					'--line-number',
					'--column',
					'--ignore-case',
				},
				pattern = [[(\@(KEYWORDS)[\s*:]?)|(\s(KEYWORDS)\s*:)]],
			},
		}
	end
}
