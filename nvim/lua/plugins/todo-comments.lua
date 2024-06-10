return {
	'folke/todo-comments.nvim',
	dependencies = {
		{
			'nvim-lua/plenary.nvim',
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
			local alt_lower = { key:lower() }
			for _, alt in pairs(val.alt) do
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
				before  = '',
				after   = '',
				keyword = 'wide_fg',
				pattern = {
					[[.*<(KEYWORDS)\s*:]], -- default
					[[.*\@(KEYWORDS)\s*]], -- default
					[[.*\\(KEYWORDS)\s*]],
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
				-- pattern = [[\b(KEYWORDS):]],  -- default
				-- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon.
				pattern = [[([@|\\](KEYWORDS):?\b)|(\b(KEYWORDS):)]],
			},
		}
	end
}
