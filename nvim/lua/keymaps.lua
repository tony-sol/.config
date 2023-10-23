local api        = vim.api
local bufferOpts = vim.bo
local diagnostic = vim.diagnostic
local lsp        = vim.lsp
local keymap     = vim.keymap
local inspect    = vim.inspect
local utils      = require('utils')

keymap.set(
	{ 'n' },
	'<leader>tb',
	':Telescope buffers<cr>',
	utils.merge({}, { desc = 'Telescope: buffers' })
)
keymap.set(
	{ 'n' },
	'<leader>td',
	':Telescope diagnostics<cr>',
	utils.merge({}, { desc = 'Telescope: diagnostics' })
)
keymap.set(
	{ 'n' },
	'<leader>tg',
	':Telescope live_grep_args<cr>',
	utils.merge({}, { desc = 'Telescope: live grep args' })
)
keymap.set(
	{ 'n' },
	'<leader>tm',
	':Telescope marks<cr>',
	utils.merge({}, { desc = 'Telescope: marks' })
)
keymap.set(
	{ 'n' },
	'<leader>tf',
	':Telescope current_buffer_fuzzy_find<cr>',
	utils.merge({}, { desc = 'Telescope: current buffer fuzzy find' })
)
keymap.set(
	{ 'n' },
	'<leader>tlr',
	':Telescope lsp_references<cr>',
	utils.merge({}, { desc = 'Telescope: LSP references' })
)
keymap.set(
	{ 'n' },
	'<leader>tld',
	':Telescope lsp_definitions<cr>',
	utils.merge({}, { desc = 'Telescope: LSP definitions' })
)
keymap.set(
	{ 'n' },
	'<leader>tli',
	':Telescope lsp_implementations<cr>',
	utils.merge({}, { desc = 'Telescope: LSP implementations' })
)
keymap.set(
	{ 'n' },
	'<leader>tlci',
	':Telescope lsp_incoming_calls<cr>',
	utils.merge({}, { desc = 'Telescope: LSP incoming calls' })
)
keymap.set(
	{ 'n' },
	'<leader>tlco',
	':Telescope lsp_outgoing_calls<cr>',
	utils.merge({}, { desc = 'Telescope: LSP outgoing calls' })
)
keymap.set(
	{ 'n' },
	'<leader>tls',
	':Telescope lsp_document_symbols<cr>',
	utils.merge({}, { desc = 'Telescope: LSP document symbols' })
)
keymap.set(
	{ 'n' },
	'<leader>hp',
	':HopPattern<cr>',
	utils.merge({}, { desc = 'Hop: by pattern' })
)
keymap.set(
	{ 'n' },
	'<leader>hP',
	':HopPatternMW<cr>',
	utils.merge({}, { desc = 'Hop: by pattern mutli-windows' })
)
keymap.set(
	{ 'n' },
	'<leader>hw',
	':HopWord<cr>',
	utils.merge({}, { desc = 'Hop: by word' })
)
keymap.set(
	{ 'n' },
	'<leader>hW',
	':HopWordMW<cr>',
	utils.merge({}, { desc = 'Hop: by word mutli-windows' })
)
keymap.set(
	{ 'n' },
	'<leader>hl',
	':HopLine<cr>',
	utils.merge({}, { desc = 'Hop: by line' })
)
keymap.set(
	{ 'n' },
	'<leader>hL',
	':HopLineMW<cr>',
	utils.merge({}, { desc = 'Hop: by line mutli-windows' })
)
keymap.set(
	{ 'n' },
	'<leader>hs',
	':HopLineStart<cr>',
	utils.merge({}, { desc = 'Hop: by line start' })
)
keymap.set(
	{ 'n' },
	'<leader>hS',
	':HopLineStartMW<cr>',
	utils.merge({}, { desc = 'Hop: by line start mutli-windows' })
)
keymap.set(
	{ 'n' },
	']c',
	':Gitsigns next_hunk<cr>',
	utils.merge({}, { desc = 'Gitsigns: next hunk' })
)
keymap.set(
	{ 'n' },
	'[c',
	':Gitsigns prev_hunk<cr>',
	utils.merge({}, { desc = 'Gitsigns: previous hunk' })
)
keymap.set(
	{ 'o', 'x' },
	'ih',
	':Gitsigns select_hunk<cr>',
	utils.merge({}, { desc = 'Gitsigns: select hunk' })
)
keymap.set(
	{ 'n', 'v' },
	'<leader>ghr',
	':Gitsigns reset_hunk<cr>',
	utils.merge({}, { desc = 'Gitsigns: reset hunk' })
)
keymap.set(
	{ 'n', 'v' },
	'<leader>ghs',
	':Gitsigns stage_hunk<cr>',
	utils.merge({}, { desc = 'Gitsigns: stage hunk' })
)
keymap.set(
	{ 'n' },
	'<leader>ghu',
	':Gitsigns undo_stage_hunk<cr>',
	utils.merge({}, { desc = 'Gitsigns: undo stage hunk' })
)
keymap.set(
	{ 'n' },
	'<leader>ghp',
	':Gitsigns preview_hunk<cr>',
	utils.merge({}, { desc = 'Gitsigns: preview hunk' })
)
keymap.set(
	{ 'n' },
	'<leader>gbS',
	':Gitsigns stage_buffer<cr>',
	utils.merge({}, { desc = 'Gitsigns: stage buffer' })
)
keymap.set(
	{ 'n' },
	'<leader>gbR',
	':Gitsigns reset_buffer<cr>',
	utils.merge({}, { desc = 'Gitsigns: reset buffer' })
)
keymap.set(
	{ 'n' },
	'<leader>gb',
	':Gitsigns blame_line<cr>',
	utils.merge({}, { desc = 'Gitsigns: blame line' })
)
keymap.set(
	{ 'n' },
	'<leader>gB',
	"<cmd>lua require('gitsigns').blame_line{full=true}<cr>",
	utils.merge({}, { desc = 'Gitsigns: blame line full' })
)
keymap.set(
	{ 'n' },
	'<leader>gd',
	':Gitsigns diffthis<cr>',
	utils.merge({}, { desc = 'Gitsigns: diff this' })
)
keymap.set(
	{ 'n' },
	'<leader>gD',
	"<cmd>lua require('gitsigns').diffthis('~')<cr>",
	utils.merge({}, { desc = 'Gitsigns: diff this ~' })
)
keymap.set(
	{ 'n' },
	'<leader>gtb',
	':Gitsigns toggle_current_line_blame<cr>',
	utils.merge({}, { desc = 'Gitsigns: toggle current line blame' })
)
keymap.set(
	{ 'n' },
	'<leader>gtd',
	':Gitsigns toggle_deleted<cr>',
	utils.merge({}, { desc = 'Gitsigns: toggle deleted' })
)
keymap.set(
	{ 'n' },
	'<leader>gtw',
	':Gitsigns toggle_word_diff<cr>',
	utils.merge({}, { desc = 'Gitsigns: toggle word diff' })
)
keymap.set(
	{ 'n' },
	'<leader>gtl',
	':Gitsigns toggle_linehl<cr>',
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
	':bnext<cr>',
	utils.merge({}, { desc = 'Buffers: next' })
)
keymap.set(
	{ 'n' },
	'[b',
	':bprevious<cr>',
	utils.merge({}, { desc = 'Buffers: previous' })
)
keymap.set(
	{ 'n' },
	']t',
	':tabnext<cr>',
	utils.merge({}, { desc = 'Tabs: next' })
)
keymap.set(
	{ 'n' },
	'[t',
	':tabprevious<cr>',
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
				'<leader>lgD',
				lsp.buf.declaration,
				utils.merge(opts, { desc = 'Lsp: go to declaration' })
			)
			keymap.set(
				{ 'n' },
				'<leader>lgd',
				lsp.buf.definition,
				utils.merge(opts, { desc = 'Lsp: go to definition' })
			)
			keymap.set(
				{ 'n' },
				'<leader>lgi',
				lsp.buf.implementation,
				utils.merge(opts, { desc = 'Lsp: go to implementation' })
			)
			keymap.set(
				{ 'n' },
				'<leader>lgr',
				lsp.buf.references,
				utils.merge(opts, { desc = 'Lsp: go to references' })
			)
			keymap.set(
				{ 'n' },
				'K',
				lsp.buf.hover,
				utils.merge(opts, { desc = 'Lsp: hover' })
			)
			keymap.set(
				{ 'n' },
				'<C-k>',
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
				'<space>d',
				lsp.buf.type_definition,
				utils.merge(opts, { desc = 'Lsp: type definition' })
			)
			keymap.set(
				{ 'n' },
				'<space>r',
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
