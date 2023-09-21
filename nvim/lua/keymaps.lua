local api        = vim.api
local bufferOpts = vim.bo
local diagnostic = vim.diagnostic
local lsp        = vim.lsp
local keymap     = vim.keymap
local inspect    = vim.inspect

keymap.set(
	{ 'n' },
	'<leader>tb',
	':Telescope buffers<cr>',
	merge({}, { desc = 'Telescope: buffers' })
)
keymap.set(
	{ 'n' },
	'<leader>td',
	':Telescope diagnostics<cr>',
	merge({}, { desc = 'Telescope: diagnostics' })
)
keymap.set(
	{ 'n' },
	'<leader>tg',
	':Telescope live_grep_args<cr>',
	merge({}, { desc = 'Telescope: live grep args' })
)
keymap.set(
	{ 'n' },
	'<leader>tm',
	':Telescope marks<cr>',
	merge({}, { desc = 'Telescope: marks' })
)
keymap.set(
	{ 'n' },
	'f',
	':HopPattern<cr>',
	merge({}, { desc = 'Hop: by pattern' })
)
keymap.set(
	{ 'n' },
	'F',
	':HopWord<cr>',
	merge({}, { desc = 'Hop: by word' })
)
keymap.set(
	{ 'n' },
	']c',
	':Gitsigns next_hunk<cr>',
	merge({}, { desc = 'Gitsigns: next hunk' })
)
keymap.set(
	{ 'n' },
	'[c',
	':Gitsigns prev_hunk<cr>',
	merge({}, { desc = 'Gitsigns: previous hunk' })
)
keymap.set(
	{ 'o', 'x' },
	'ih',
	':Gitsigns select_hunk<cr>',
	merge({}, { desc = 'Gitsigns: select hunk' })
)
keymap.set(
	{ 'n', 'v' },
	'<leader>ghr',
	':Gitsigns reset_hunk<cr>',
	merge({}, { desc = 'Gitsigns: reset hunk' })
)
keymap.set(
	{ 'n', 'v' },
	'<leader>ghs',
	':Gitsigns stage_hunk<cr>',
	merge({}, { desc = 'Gitsigns: stage hunk' })
)
keymap.set(
	{ 'n' },
	'<leader>ghu',
	':Gitsigns undo_stage_hunk<cr>',
	merge({}, { desc = 'Gitsigns: undo stage hunk' })
)
keymap.set(
	{ 'n' },
	'<leader>ghp',
	':Gitsigns preview_hunk<cr>',
	merge({}, { desc = 'Gitsigns: preview hunk' })
)
keymap.set(
	{ 'n' },
	'<leader>gbS',
	':Gitsigns stage_buffer<cr>',
	merge({}, { desc = 'Gitsigns: stage buffer' })
)
keymap.set(
	{ 'n' },
	'<leader>gbR',
	':Gitsigns reset_buffer<cr>',
	merge({}, { desc = 'Gitsigns: reset buffer' })
)
keymap.set(
	{ 'n' },
	'<leader>gb',
	':Gitsigns blame_line<cr>',
	merge({}, { desc = 'Gitsigns: blame line' })
)
keymap.set(
	{ 'n' },
	'<leader>gB',
	"<cmd>lua require('gitsigns').blame_line{full=true}<cr>",
	merge({}, { desc = 'Gitsigns: blame line full' })
)
keymap.set(
	{ 'n' },
	'<leader>gd',
	':Gitsigns diffthis<cr>',
	merge({}, { desc = 'Gitsigns: diff this' })
)
keymap.set(
	{ 'n' },
	'<leader>gD',
	"<cmd>lua require('gitsigns').diffthis('~')<cr>",
	merge({}, { desc = 'Gitsigns: diff this ~' })
)
keymap.set(
	{ 'n' },
	'<leader>gtb',
	':Gitsigns toggle_current_line_blame<cr>',
	merge({}, { desc = 'Gitsigns: toggle current line blame' })
)
keymap.set(
	{ 'n' },
	'<leader>gtd',
	':Gitsigns toggle_deleted<cr>',
	merge({}, { desc = 'Gitsigns: toggle deleted' })
)
keymap.set(
	{ 'n' },
	'<leader>gtw',
	':Gitsigns toggle_word_diff<cr>',
	merge({}, { desc = 'Gitsigns: toggle word diff' })
)
keymap.set(
	{ 'n' },
	'<leader>gtl',
	':Gitsigns toggle_linehl<cr>',
	merge({}, { desc = 'Gitsigns: toggle line highlight' })
)
keymap.set(
	{ 'n' },
	'<space>q',
	diagnostic.setloclist,
	merge({}, { desc = 'Diagnostic: setloclist' })
)
keymap.set(
	{ 'n' },
	'<space>e',
	diagnostic.open_float,
	merge({}, { desc = 'Diagnostic: open float' })
)
keymap.set(
	{ 'n' },
	'[d',
	diagnostic.goto_prev,
	merge({}, { desc = 'Diagnostic: go to previous' })
)
keymap.set(
	{ 'n' },
	']d',
	diagnostic.goto_next,
	merge({}, { desc = 'Diagnostic: go to next' })
)
keymap.set(
	{ 'n' },
	']b',
	':bnext<cr>',
	merge({}, { desc = 'Buffers: next' })
)
keymap.set(
	{ 'n' },
	'[b',
	':bprevious<cr>',
	merge({}, { desc = 'Buffers: previous' })
)
keymap.set(
	{ 'n' },
	']t',
	':tabnext<cr>',
	merge({}, { desc = 'Tabs: next' })
)
keymap.set(
	{ 'n' },
	'[t',
	':tabprevious<cr>',
	merge({}, { desc = 'Tabs: previous' })
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
				merge(opts, { desc = 'Lsp: go to declaration' })
			)
			keymap.set(
				{ 'n' },
				'<leader>lgd',
				lsp.buf.definition,
				merge(opts, { desc = 'Lsp: go to definition' })
			)
			keymap.set(
				{ 'n' },
				'<leader>lgi',
				lsp.buf.implementation,
				merge(opts, { desc = 'Lsp: go to implementation' })
			)
			keymap.set(
				{ 'n' },
				'<leader>lgr',
				lsp.buf.references,
				merge(opts, { desc = 'Lsp: go to references' })
			)
			keymap.set(
				{ 'n' },
				'K',
				lsp.buf.hover,
				merge(opts, { desc = 'Lsp: hover' })
			)
			keymap.set(
				{ 'n' },
				'<C-k>',
				lsp.buf.signature_help,
				merge(opts, { desc = 'Lsp: signature help' })
			)
			keymap.set(
				{ 'n' },
				'<space>wa',
				lsp.buf.add_workspace_folder,
				merge(opts, { desc = 'Lsp: add workspace folder' })
			)
			keymap.set(
				{ 'n' },
				'<space>wr',
				lsp.buf.remove_workspace_folder,
				merge(opts, { desc = 'Lsp: remove workspace folder' })
			)
			keymap.set(
				{ 'n' },
				'<space>wl',
				function()
					print(inspect(lsp.buf.list_workspace_folders()))
				end,
				merge(opts, { desc = 'Lsp: list workspace folders' })
			)
			keymap.set(
				{ 'n' },
				'<space>a',
				lsp.buf.code_action,
				merge(opts, { desc = 'Lsp: code action' })
			)
			keymap.set(
				{ 'n' },
				'<space>d',
				lsp.buf.type_definition,
				merge(opts, { desc = 'Lsp: type definition' })
			)
			keymap.set(
				{ 'n' },
				'<space>r',
				lsp.buf.rename,
				merge(opts, { desc = 'Lsp: rename' })
			)
			keymap.set(
				{ 'n' },
				'<space>f',
				function()
					lsp.buf.format { async = true }
				end,
				merge(opts, { desc = 'Lsp: format' })
			)
		end,
	})
