---@diagnostic disable: undefined-global
local api                  = vim.api
local bufferOpts           = vim.bo
local command              = vim.cmd
local diagnostic           = vim.diagnostic
local lsp                  = vim.lsp
local keymap               = vim.keymap
local inspect              = vim.inspect
local options              = vim.opt
---@diagnostic enable: undefined-global
local utils                = require('utils')
local ufo_preview          = require('ufo.preview')
local outline              = require('outline')
local telescope_command    = require('telescope.command')
local telescope_builtin    = require('telescope.builtin')
local telescope_extensions = require('telescope').extensions
local hop                  = require('hop')
local gitsigns             = require('gitsigns')
local tree_api             = require('nvim-tree.api')
local kubectl              = require('kubectl')

keymap.set(
	{ 'n' },
	'qq',
	function()
		command.quit()
	end,
	{ desc = 'Window: quit' }
)
keymap.set(
	{ 'n' },
	'qQ',
	function()
		command.quitall()
	end,
	{ desc = 'Window: quit all' }
)
keymap.set(
	{ 'n' },
	'<M-z>',
	function()
		---@see https://github.com/neovim/neovim/blob/master/runtime/lua/vim/_options.lua
		---@diagnostic disable-next-line:undefined-field actual type of wrap is Option
		options.wrap = not options.wrap:get()
	end,
	{ desc = 'Toggle softwrap' }
)
keymap.set(
	{ 'v' },
	'K',
	":m '<-2<CR>gv=gv",
	{ desc = 'Move line up' }
)
keymap.set(
	{ 'v' },
	'J',
	":m '>+1<CR>gv=gv",
	{ desc = 'Move line down' }
)
keymap.set(
	{ 'n' },
	'zp',
	function()
		ufo_preview:peekFoldedLinesUnderCursor()
	end,
	{ desc = 'Fold preview' }
)
keymap.set(
	{ 'n' },
	'<leader>O',
	function()
		outline.toggle({ focus_outline = false })
	end,
	{ desc = 'Outline' }
)
keymap.set(
	{ 'n' },
	'<leader>N',
	function()
		tree_api.tree.toggle()
	end,
	{ desc = 'NvimTree' }
)
keymap.set(
	{ 'n' },
	'<leader>nf',
	function()
		tree_api.tree.focus()
	end,
	{ desc = 'NvimTree: focus' }
)
keymap.set(
	{ 'n' },
	'<leader>K',
	function()
		kubectl.toggle()
	end,
	{ desc = 'Kubectl' }
)
keymap.set(
	{ 'n' },
	'<leader>T',
	function()
		telescope_command.load_command()
	end,
	{ desc = 'Telescope' }
)
keymap.set(
	{ 'n' },
	'<leader>tb',
	function()
		telescope_builtin.buffers()
	end,
	{ desc = 'Telescope: buffers' }
)
keymap.set(
	{ 'n' },
	'<leader>td',
	function()
		telescope_builtin.diagnostics()
	end,
	{ desc = 'Telescope: diagnostics' }
)
keymap.set(
	{ 'n' },
	'<leader>tG',
	function()
		telescope_extensions['live_grep_args'].live_grep_args()
	end,
	{ desc = 'Telescope: Live Grep Args' }
)
keymap.set(
	{ 'n' },
	'<leader>tm',
	function()
		telescope_builtin.marks()
	end,
	{ desc = 'Telescope: marks' }
)
keymap.set(
	{ 'n' },
	'<leader>tn',
	function()
		telescope_extensions['noice'].noice()
	end,
	{ desc = 'Telescope: Noice' }
)
keymap.set(
	{ 'n' },
	'<leader>tN',
	function()
		telescope_extensions['notify'].notify()
	end,
	{ desc = 'Telescope: Notify' }
)
keymap.set(
	{ 'n' },
	'<leader>tr',
	function()
		telescope_builtin.registers()
	end,
	{ desc = 'Telescope: registers' }
)
keymap.set(
	{ 'n' },
	'<leader>tR',
	function()
		telescope_extensions['rest'].select_env()
	end,
	{ desc = 'Telescope: REST env' }
)
keymap.set(
	{ 'n' },
	'<leader>tf',
	function()
		telescope_builtin.current_buffer_fuzzy_find()
	end,
	{ desc = 'Telescope: current buffer fuzzy find' }
)
keymap.set(
	{ 'n' },
	'<leader>tF',
	function()
		telescope_builtin.find_files()
	end,
	{ desc = 'Telescope: find files' }
)
keymap.set(
	{ 'n' },
	'<leader>to',
	function()
		telescope_builtin.oldfiles()
	end,
	{ desc = 'Telescope: old (recent) files' }
)
keymap.set(
	{ 'n' },
	'<leader>tT',
	function()
		telescope_extensions['todo-comments'].todo()
	end,
	{ desc = 'Telescope: Todo-Comments' }
)
keymap.set(
	{ 'n' },
	'<leader>tt',
	function()
		telescope_builtin.treesitter()
	end,
	{ desc = 'Telescope: treesitter' }
)
keymap.set(
	{ 'n' },
	'<leader>tgc',
	function()
		telescope_builtin.git_commits()
	end,
	{ desc = 'Telescope: git commits' }
)
keymap.set(
	{ 'n' },
	'<leader>tgC',
	function()
		telescope_builtin.git_bcommits()
	end,
	{ desc = 'Telescope: git buffer commits' }
)
keymap.set(
	{ 'n' },
	'<leader>tgb',
	function()
		telescope_builtin.git_branches()
	end,
	{ desc = 'Telescope: git branches' }
)
keymap.set(
	{ 'n' },
	'<leader>tgs',
	function()
		telescope_builtin.git_status()
	end,
	{ desc = 'Telescope: git status' }
)
keymap.set(
	{ 'n' },
	'<leader>tgS',
	function()
		telescope_builtin.git_stash()
	end,
	{ desc = 'Telescope: git stash' }
)
keymap.set(
	{ 'n' },
	'<leader>tlr',
	function()
		telescope_builtin.lsp_references()
	end,
	{ desc = 'Telescope: LSP references' }
)
keymap.set(
	{ 'n' },
	'<leader>tld',
	function()
		telescope_builtin.lsp_definitions()
	end,
	{ desc = 'Telescope: LSP definitions' }
)
keymap.set(
	{ 'n' },
	'<leader>tli',
	function()
		telescope_builtin.lsp_definitions()
	end,
	{ desc = 'Telescope: LSP implementations' }
)
keymap.set(
	{ 'n' },
	'<leader>tlci',
	function()
		telescope_builtin.lsp_incoming_calls()
	end,
	{ desc = 'Telescope: LSP incoming calls' }
)
keymap.set(
	{ 'n' },
	'<leader>tlco',
	function()
		telescope_builtin.lsp_outgoing_calls()
	end,
	{ desc = 'Telescope: LSP outgoing calls' }
)
keymap.set(
	{ 'n' },
	'<leader>tls',
	function()
		telescope_builtin.lsp_document_symbols()
	end,
	{ desc = 'Telescope: LSP document symbols' }
)
keymap.set(
	{ 'n' },
	'<leader>tj',
	function()
		telescope_builtin.jumplist()
	end,
	{ desc = 'Telescope: jumplist' }
)
keymap.set(
	{ 'n' },
	'<leader>th',
	function()
		telescope_builtin.command_history()
	end,
	{ desc = 'Telescope: history' }
)
keymap.set(
	{ 'n' },
	'<leader>tc',
	function()
		telescope_builtin.commands()
	end,
	{ desc = 'Telescope: commands' }
)
keymap.set(
	{ 'n' },
	'<leader>tA',
	function()
		telescope_extensions['ast_grep'].ast_grep()
	end,
	{ desc = 'Telescope: AST-grep' }
)
keymap.set(
	{ 'n' },
	'<leader>hp',
	function()
		hop.hint_patterns()
	end,
	{ desc = 'Hop: by pattern' }
)
keymap.set(
	{ 'n' },
	'<leader>hP',
	function()
		hop.hint_patterns({ multi_windows = true })
	end,
	{ desc = 'Hop: by pattern mutli-windows' }
)
keymap.set(
	{ 'n' },
	'<leader>hw',
	function()
		hop.hint_words()
	end,
	{ desc = 'Hop: by word' }
)
keymap.set(
	{ 'n' },
	'<leader>hW',
	function()
		hop.hint_words({ multi_windows = true })
	end,
	{ desc = 'Hop: by word mutli-windows' }
)
keymap.set(
	{ 'n' },
	'<leader>hl',
	function()
		hop.hint_lines()
	end,
	{ desc = 'Hop: by line' }
)
keymap.set(
	{ 'n' },
	'<leader>hL',
	function()
		hop.hint_lines({ multi_windows = true })
	end,
	{ desc = 'Hop: by line mutli-windows' }
)
keymap.set(
	{ 'n' },
	'<leader>hs',
	function()
		hop.hint_lines_skip_whitespace()
	end,
	{ desc = 'Hop: by line start' }
)
keymap.set(
	{ 'n' },
	'<leader>hS',
	function()
		hop.hint_lines_skip_whitespace({ multi_windows = true })
	end,
	{ desc = 'Hop: by line start mutli-windows' }
)
keymap.set(
	{ 'n' },
	']c',
	function()
		gitsigns.nav_hunk('next')
	end,
	{ desc = 'Gitsigns: next hunk' }
)
keymap.set(
	{ 'n' },
	'[c',
	function()
		gitsigns.nav_hunk('prev')
	end,
	{ desc = 'Gitsigns: previous hunk' }
)
keymap.set(
	{ 'o', 'x' },
	'ih',
	function()
		gitsigns.select_hunk()
	end,
	{ desc = 'Gitsigns: select hunk' }
)
keymap.set(
	{ 'n', 'v' },
	'<leader>G',
	function()
		require('gitsigns.cli').run({ args = '' })
	end,
	{ desc = 'Gitsigns' }
)
keymap.set(
	{ 'n', 'v' },
	'<leader>gq',
	function()
		gitsigns.setloclist()
	end,
	{ desc = 'Gitsigns: setloclist' }
)
keymap.set(
	{ 'n', 'v' },
	'<leader>gr',
	function()
		gitsigns.reset_hunk()
	end,
	{ desc = 'Gitsigns: reset hunk' }
)
keymap.set(
	{ 'n' },
	'<leader>gR',
	function()
		gitsigns.reset_buffer()
	end,
	{ desc = 'Gitsigns: reset buffer' }
)
keymap.set(
	{ 'n', 'v' },
	'<leader>gs',
	function()
		gitsigns.stage_hunk()
	end,
	{ desc = 'Gitsigns: stage hunk' }
)
keymap.set(
	{ 'n' },
	'<leader>gS',
	function()
		gitsigns.stage_buffer()
	end,
	{ desc = 'Gitsigns: stage buffer' }
)
keymap.set(
	{ 'n' },
	'<leader>gu',
	function()
		gitsigns.undo_stage_hunk()
	end,
	{ desc = 'Gitsigns: undo stage hunk' }
)
keymap.set(
	{ 'n' },
	'<leader>gp',
	function()
		gitsigns.preview_hunk()
	end,
	{ desc = 'Gitsigns: preview hunk' }
)
keymap.set(
	{ 'n' },
	'<leader>gP',
	function()
		gitsigns.preview_hunk_inline()
	end,
	{ desc = 'Gitsigns: preview hunk inline' }
)
keymap.set(
	{ 'n' },
	'<leader>gb',
	function()
		gitsigns.blame_line()
	end,
	{ desc = 'Gitsigns: blame line' }
)
keymap.set(
	{ 'n' },
	'<leader>gB',
	function()
		gitsigns.blame_line({ full = true })
	end,
	{ desc = 'Gitsigns: blame line full' }
)
keymap.set(
	{ 'n' },
	'<leader>gd',
	function()
		gitsigns.diffthis()
	end,
	{ desc = 'Gitsigns: diff this' }
)
keymap.set(
	{ 'n' },
	'<leader>gD',
	function()
		gitsigns.diffthis('~')
	end,
	{ desc = 'Gitsigns: diff this ~' }
)
keymap.set(
	{ 'n' },
	'<leader>gtb',
	function()
		gitsigns.toggle_current_line_blame()
	end,
	{ desc = 'Gitsigns: toggle current line blame' }
)
keymap.set(
	{ 'n' },
	'<leader>gtd',
	function()
		gitsigns.toggle_deleted()
	end,
	{ desc = 'Gitsigns: toggle deleted' }
)
keymap.set(
	{ 'n' },
	'<leader>gtw',
	function()
		gitsigns.toggle_word_diff()
	end,
	{ desc = 'Gitsigns: toggle word diff' }
)
keymap.set(
	{ 'n' },
	'<leader>gtl',
	function()
		gitsigns.toggle_linehl()
	end,
	{ desc = 'Gitsigns: toggle line number highlight' }
)
keymap.set(
	{ 'n' },
	'<leader>gtn',
	function()
		gitsigns.toggle_numhl()
	end,
	{ desc = 'Gitsigns: toggle line highlight' }
)
keymap.set(
	{ 'n' },
	'<leader>gts',
	function()
		gitsigns.toggle_signs()
	end,
	{ desc = 'Gitsigns: toggle signs' }
)
keymap.set(
	{ 'n' },
	'<space>q',
	diagnostic.setloclist,
	{ desc = 'Diagnostic: setloclist' }
)
keymap.set(
	{ 'n' },
	'<space>e',
	diagnostic.open_float,
	{ desc = 'Diagnostic: open float' }
)
keymap.set(
	{ 'n' },
	'[d',
	diagnostic.goto_prev,
	{ desc = 'Diagnostic: go to previous' }
)
keymap.set(
	{ 'n' },
	']d',
	diagnostic.goto_next,
	{ desc = 'Diagnostic: go to next' }
)
keymap.set(
	{ 'n' },
	']b',
	function()
		command.bnext()
	end,
	{ desc = 'Buffers: next' }
)
keymap.set(
	{ 'n' },
	'[b',
	function()
		command.bprevious()
	end,
	{ desc = 'Buffers: previous' }
)
keymap.set(
	{ 'n' },
	'<leader>b]',
	function()
		command.sbnext()
	end,
	{ desc = 'Buffers: split and open next' }
)
keymap.set(
	{ 'n' },
	'<leader>b[',
	function()
		command.sbprevious()
	end,
	{ desc = 'Buffers: split and open previous' }
)
keymap.set(
	{ 'n' },
	'<leader>bd',
	function()
		command.bdelete()
	end,
	{ desc = 'Buffers: close' }
)
keymap.set(
	{ 'n' },
	']t',
	function()
		command.tabnext()
	end,
	{ desc = 'Tabs: next' }
)
keymap.set(
	{ 'n' },
	'[t',
	function()
		command.tabprevious()
	end,
	{ desc = 'Tabs: previous' }
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
				function()
					lsp.buf.declaration()
				end,
				utils.merge(opts, { desc = 'Lsp: go to declaration' })
			)
			keymap.set(
				{ 'n' },
				'<space>d',
				function()
					lsp.buf.definition()
				end,
				utils.merge(opts, { desc = 'Lsp: go to definition' })
			)
			keymap.set(
				{ 'n' },
				'<space>i',
				function()
					lsp.buf.implementation()
				end,
				utils.merge(opts, { desc = 'Lsp: go to implementation' })
			)
			keymap.set(
				{ 'n' },
				'<space>r',
				function()
					lsp.buf.references()
				end,
				utils.merge(opts, { desc = 'Lsp: go to references' })
			)
			keymap.set(
				{ 'n' },
				'<space>h',
				function()
					lsp.buf.hover()
				end,
				utils.merge(opts, { desc = 'Lsp: hover' })
			)
			keymap.set(
				{ 'n' },
				'<space>s',
				function()
					lsp.buf.signature_help()
				end,
				utils.merge(opts, { desc = 'Lsp: signature help' })
			)
			keymap.set(
				{ 'n' },
				'<space>wa',
				function()
					lsp.buf.add_workspace_folder()
				end,
				utils.merge(opts, { desc = 'Lsp: add workspace folder' })
			)
			keymap.set(
				{ 'n' },
				'<space>wr',
				function()
					lsp.buf.remove_workspace_folder()
				end,
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
				function()
					lsp.buf.code_action()
				end,
				utils.merge(opts, { desc = 'Lsp: code action' })
			)
			keymap.set(
				{ 'n' },
				'<space>t',
				function()
					lsp.buf.type_definition()
				end,
				utils.merge(opts, { desc = 'Lsp: type definition' })
			)
			keymap.set(
				{ 'n' },
				'<space>R',
				function()
					lsp.buf.rename()
				end,
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
