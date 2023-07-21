return {
	'folke/todo-comments.nvim',
	dependencies = {
		{
			'nvim-lua/plenary.nvim',
		},
	},
	event  = 'VimEnter',
	config = function ()
		local todo_comments = require('todo-comments')
		todo_comments.setup {
			-- @HACK wait for case-insensitive highlighting
			keywords  = {
				URL  = { icon = ' ', alt = { 'LINK', 'url', 'link' }, color = 'hint' },
				DOC  = { icon = ' ', alt = { 'DOCS', 'doc', 'docs', 'see' }, color = 'info' },
				FIX  = { icon = ' ', alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE', 'fix', 'fixme', 'bug', 'fixit', 'issue' } },
				TODO = { icon = ' ', alt = { 'todo' } },
				HACK = { icon = ' ', alt = { 'hack' } },
				WARN = { icon = ' ', alt = { 'WARNING', 'XXX', 'warn', 'warning', 'xxx' } },
				PERF = { icon = ' ', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE', 'perf', 'optim', 'performance', 'optimize' } },
				NOTE = { icon = ' ', alt = { 'INFO', 'note', 'info' } },
				TEST = { icon = ' ⏲', alt = { 'TESTING', 'PASSED', 'FAILED', 'test', 'testing', 'passed', 'failed' } },
			},
			highlight = {
				before  = '',
				after   = 'fg',
				keyword = 'wide',
				pattern = {
					[[.*<(KEYWORDS)\s*:]], -- default
					[[.*\@(KEYWORDS)\s*]], -- default
					[[.*\\(KEYWORDS)\s*]],
				},
			},
			search = {
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
