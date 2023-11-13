local api        = vim.api
local bufferOpts = vim.bo
local command    = vim.cmd
local diagnostic = vim.diagnostic
local lsp        = vim.lsp
local keymap     = vim.keymap
local inspect    = vim.inspect
local utils      = require('utils')

keymap.set(
	{ 'n' },
	'zp',
	function()
		require('ufo.preview'):peekFoldedLinesUnderCursor()
	end,
	utils.merge({}, { desc = 'Fold preview' })
)
keymap.set(
	{ 'n' },
	'<leader>tb',
	function()
		require('telescope.builtin').buffers()
	end,
	utils.merge({}, { desc = 'Telescope: buffers' })
)
keymap.set(
	{ 'n' },
	'<leader>td',
	function()
		require('telescope.builtin').diagnostics()
	end,
	utils.merge({}, { desc = 'Telescope: diagnostics' })
)
keymap.set(
	{ 'n' },
	'<leader>tG',
	function()
		require('telescope').extensions.live_grep_args.live_grep_args()
	end,
	utils.merge({}, { desc = 'Telescope: live grep args' })
)
keymap.set(
	{ 'n' },
	'<leader>tm',
	function()
		require('telescope.builtin').marks()
	end,
	utils.merge({}, { desc = 'Telescope: marks' })
)
keymap.set(
	{ 'n' },
	'<leader>tf',
	function()
		require('telescope.builtin').current_buffer_fuzzy_find()
	end,
	utils.merge({}, { desc = 'Telescope: current buffer fuzzy find' })
)
keymap.set(
	{ 'n' },
	'<leader>tF',
	function()
		require('telescope.builtin').find_files()
	end,
	utils.merge({}, { desc = 'Telescope: find files' })
)
keymap.set(
	{ 'n' },
	'<leader>to',
	function()
		require('telescope.builtin').oldfiles()
	end,
	utils.merge({}, { desc = 'Telescope: old (recent) files' })
)
keymap.set(
	{ 'n' },
	'<leader>tt',
	function()
		require('telescope.builtin').current_buffer_tags()
	end,
	utils.merge({}, { desc = 'Telescope: current buffer tags' })
)
keymap.set(
	{ 'n' },
	'<leader>tgc',
	function()
		require('telescope.builtin').git_commits()
	end,
	utils.merge({}, { desc = 'Telescope: git commits' })
)
keymap.set(
	{ 'n' },
	'<leader>tgC',
	function()
		require('telescope.builtin').git_bcommits()
	end,
	utils.merge({}, { desc = 'Telescope: git buffer commits' })
)
keymap.set(
	{ 'n' },
	'<leader>tgb',
	function()
		require('telescope.builtin').git_branches()
	end,
	utils.merge({}, { desc = 'Telescope: git branches' })
)
keymap.set(
	{ 'n' },
	'<leader>tgs',
	function()
		require('telescope.builtin').git_status()
	end,
	utils.merge({}, { desc = 'Telescope: git status' })
)
keymap.set(
	{ 'n' },
	'<leader>tgS',
	function()
		require('telescope.builtin').git_stash()
	end,
	utils.merge({}, { desc = 'Telescope: git stash' })
)
keymap.set(
	{ 'n' },
	'<leader>tlr',
	function()
		require('telescope.builtin').lsp_references()
	end,
	utils.merge({}, { desc = 'Telescope: LSP references' })
)
keymap.set(
	{ 'n' },
	'<leader>tld',
	function()
		require('telescope.builtin').lsp_definitions()
	end,
	utils.merge({}, { desc = 'Telescope: LSP definitions' })
)
keymap.set(
	{ 'n' },
	'<leader>tli',
	function()
		require('telescope.builtin').lsp_definitions()
	end,
	utils.merge({}, { desc = 'Telescope: LSP implementations' })
)
keymap.set(
	{ 'n' },
	'<leader>tlci',
	function()
		require('telescope.builtin').lsp_incoming_calls()
	end,
	utils.merge({}, { desc = 'Telescope: LSP incoming calls' })
)
keymap.set(
	{ 'n' },
	'<leader>tlco',
	function()
		require('telescope.builtin').lsp_outgoing_calls()
	end,
	utils.merge({}, { desc = 'Telescope: LSP outgoing calls' })
)
keymap.set(
	{ 'n' },
	'<leader>tls',
	function()
		require('telescope.builtin').lsp_document_symbols()
	end,
	utils.merge({}, { desc = 'Telescope: LSP document symbols' })
)
keymap.set(
	{ 'n' },
	'<leader>hp',
	function()
		require('hop').hint_patterns()
	end,
	utils.merge({}, { desc = 'Hop: by pattern' })
)
keymap.set(
	{ 'n' },
	'<leader>hP',
	function()
		require('hop').hint_patterns({ multi_windows = true })
	end,
	utils.merge({}, { desc = 'Hop: by pattern mutli-windows' })
)
keymap.set(
	{ 'n' },
	'<leader>hw',
	function()
		require('hop').hint_words()
	end,
	utils.merge({}, { desc = 'Hop: by word' })
)
keymap.set(
	{ 'n' },
	'<leader>hW',
	function()
		require('hop').hint_words({ multi_windows = true })
	end,
	utils.merge({}, { desc = 'Hop: by word mutli-windows' })
)
keymap.set(
	{ 'n' },
	'<leader>hl',
	function()
		require('hop').hint_lines()
	end,
	utils.merge({}, { desc = 'Hop: by line' })
)
keymap.set(
	{ 'n' },
	'<leader>hL',
	function()
		require('hop').hint_lines({ multi_windows = true })
	end,
	utils.merge({}, { desc = 'Hop: by line mutli-windows' })
)
keymap.set(
	{ 'n' },
	'<leader>hs',
	function()
		require('hop').hint_lines_skip_whitespace()
	end,
	utils.merge({}, { desc = 'Hop: by line start' })
)
keymap.set(
	{ 'n' },
	'<leader>hS',
	function()
		require('hop').hint_lines_skip_whitespace({ multi_windows = true })
	end,
	utils.merge({}, { desc = 'Hop: by line start mutli-windows' })
)
keymap.set(
	{ 'n' },
	']c',
	function()
		require('gitsigns').next_hunk()
	end,
	utils.merge({}, { desc = 'Gitsigns: next hunk' })
)
keymap.set(
	{ 'n' },
	'[c',
	function()
		require('gitsigns').prev_hunk()
	end,
	utils.merge({}, { desc = 'Gitsigns: previous hunk' })
)
keymap.set(
	{ 'o', 'x' },
	'ih',
	function()
		require('gitsigns').select_hunk()
	end,
	utils.merge({}, { desc = 'Gitsigns: select hunk' })
)
keymap.set(
	{ 'n', 'v' },
	'<leader>ghr',
	function()
		require('gitsigns').reset_hunk()
	end,
	utils.merge({}, { desc = 'Gitsigns: reset hunk' })
)
keymap.set(
	{ 'n', 'v' },
	'<leader>ghs',
	function()
		require('gitsigns').stage_hunk()
	end,
	utils.merge({}, { desc = 'Gitsigns: stage hunk' })
)
keymap.set(
	{ 'n' },
	'<leader>ghu',
	function()
		require('gitsigns').stage_hunk()
	end,
	utils.merge({}, { desc = 'Gitsigns: undo stage hunk' })
)
keymap.set(
	{ 'n' },
	'<leader>ghp',
	function()
		require('gitsigns').preview_hunk()
	end,
	utils.merge({}, { desc = 'Gitsigns: preview hunk' })
)
keymap.set(
	{ 'n' },
	'<leader>gbS',
	function()
		require('gitsigns').stage_buffer()
	end,
	utils.merge({}, { desc = 'Gitsigns: stage buffer' })
)
keymap.set(
	{ 'n' },
	'<leader>gbR',
	function()
		require('gitsigns').reset_buffer()
	end,
	utils.merge({}, { desc = 'Gitsigns: reset buffer' })
)
keymap.set(
	{ 'n' },
	'<leader>gb',
	function()
		require('gitsigns').blame_line()
	end,
	utils.merge({}, { desc = 'Gitsigns: blame line' })
)
keymap.set(
	{ 'n' },
	'<leader>gB',
	function()
		require('gitsigns').blame_line({ full = true })
	end,
	utils.merge({}, { desc = 'Gitsigns: blame line full' })
)
keymap.set(
	{ 'n' },
	'<leader>gd',
	function()
		require('gitsigns').diffthis()
	end,
	utils.merge({}, { desc = 'Gitsigns: diff this' })
)
keymap.set(
	{ 'n' },
	'<leader>gD',
	function()
		require('gitsigns').diffthis('~')
	end,
	utils.merge({}, { desc = 'Gitsigns: diff this ~' })
)
keymap.set(
	{ 'n' },
	'<leader>gtb',
	function()
		require('gitsigns').toggle_current_line_blame()
	end,
	utils.merge({}, { desc = 'Gitsigns: toggle current line blame' })
)
keymap.set(
	{ 'n' },
	'<leader>gtd',
	function()
		require('gitsigns').toggle_deleted()
	end,
	utils.merge({}, { desc = 'Gitsigns: toggle deleted' })
)
keymap.set(
	{ 'n' },
	'<leader>gtw',
	function()
		require('gitsigns').toggle_word_diff()
	end,
	utils.merge({}, { desc = 'Gitsigns: toggle word diff' })
)
keymap.set(
	{ 'n' },
	'<leader>gtl',
	function()
		require('gitsigns').toggle_linehl()
	end,
	utils.merge({}, { desc = 'Gitsigns: toggle line highlight' })
)
keymap.set(
	{ 'n' },
	'<space>q',
	diagnostic.setloclist,
	utils.merge({}, { desc = 'Diagnostic: setloclist' })
)
keymap.set(
	{ 'n' },
	'<space>e',
	diagnostic.open_float,
	utils.merge({}, { desc = 'Diagnostic: open float' })
)
keymap.set(
	{ 'n' },
	'[d',
	diagnostic.goto_prev,
	utils.merge({}, { desc = 'Diagnostic: go to previous' })
)
keymap.set(
	{ 'n' },
	']d',
	diagnostic.goto_next,
	utils.merge({}, { desc = 'Diagnostic: go to next' })
)
keymap.set(
	{ 'n' },
	']b',
	function()
		command.bnext()
	end,
	utils.merge({}, { desc = 'Buffers: next' })
)
keymap.set(
	{ 'n' },
	'[b',
	function()
		command.bprevious()
	end,
	utils.merge({}, { desc = 'Buffers: previous' })
)
keymap.set(
	{ 'n' },
	'<leader>b]',
	function()
		command.sbnext()
	end,
	utils.merge({}, { desc = 'Buffers: split and open next' })
)
keymap.set(
	{ 'n' },
	'<leader>b[',
	function()
		command.sbprevious()
	end,
	utils.merge({}, { desc = 'Buffers: split and open previous' })
)
keymap.set(
	{ 'n' },
	'<leader>bd',
	function()
		command.bdelete()
	end,
	utils.merge({}, { desc = 'Buffers: close' })
)
keymap.set(
	{ 'n' },
	']t',
	function()
		command.tabnext()
	end,
	utils.merge({}, { desc = 'Tabs: next' })
)
keymap.set(
	{ 'n' },
	'[t',
	function()
		command.tabprevious()
	end,
	utils.merge({}, { desc = 'Tabs: previous' })
)

-- Use LspAttach autocommand to only map the following keys after the language server attaches to the current buffer
api.nvim_create_autocmd({ 'LspAttach' },
	{
		group = api.nvim_create_augroup('UserLspConfig', {}),
		callback = function(ev)
			-- Enable completion triggered by <c-x><c-o>
			bufferOpts[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
			-- Buffer local mappings.
			-- See `:help vim.lsp.*` for documentation on any of the below functions
			local opts = {
				buffer = ev.buf,
			}
			keymap.set(
				{ 'n' },
				'<space>D',
				lsp.buf.declaration,
				utils.merge(opts, { desc = 'Lsp: go to declaration' })
			)
			keymap.set(
				{ 'n' },
				'<space>d',
				lsp.buf.definition,
				utils.merge(opts, { desc = 'Lsp: go to definition' })
			)
			keymap.set(
				{ 'n' },
				'<space>i',
				lsp.buf.implementation,
				utils.merge(opts, { desc = 'Lsp: go to implementation' })
			)
			keymap.set(
				{ 'n' },
				'<space>r',
				lsp.buf.references,
				utils.merge(opts, { desc = 'Lsp: go to references' })
			)
			keymap.set(
				{ 'n' },
				'<space>h',
				lsp.buf.hover,
				utils.merge(opts, { desc = 'Lsp: hover' })
			)
			keymap.set(
				{ 'n' },
				'<space>s',
				lsp.buf.signature_help,
				utils.merge(opts, { desc = 'Lsp: signature help' })
			)
			keymap.set(
				{ 'n' },
				'<space>wa',
				lsp.buf.add_workspace_folder,
				utils.merge(opts, { desc = 'Lsp: add workspace folder' })
			)
			keymap.set(
				{ 'n' },
				'<space>wr',
				lsp.buf.remove_workspace_folder,
				utils.merge(opts, { desc = 'Lsp: remove workspace folder' })
			)
			keymap.set(
				{ 'n' },
				'<space>wl',
				function()
					print(inspect(lsp.buf.list_workspace_folders()))
				end,
				utils.merge(opts, { desc = 'Lsp: list workspace folders' })
			)
			keymap.set(
				{ 'n' },
				'<space>a',
				lsp.buf.code_action,
				utils.merge(opts, { desc = 'Lsp: code action' })
			)
			keymap.set(
				{ 'n' },
				'<space>t',
				lsp.buf.type_definition,
				utils.merge(opts, { desc = 'Lsp: type definition' })
			)
			keymap.set(
				{ 'n' },
				'<space>R',
				lsp.buf.rename,
				utils.merge(opts, { desc = 'Lsp: rename' })
			)
			keymap.set(
				{ 'n' },
				'<space>f',
				function()
					lsp.buf.format { async = true }
				end,
				utils.merge(opts, { desc = 'Lsp: format' })
			)
		end,
	})
