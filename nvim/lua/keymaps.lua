local api         = vim.api
local bufferOpts  = vim.bo
local diagnostic  = vim.diagnostic
local lsp         = vim.lsp
local keymap      = vim.keymap
local inspect     = vim.inspect

local table_merge = function(t1, t2)
	return vim.tbl_deep_extend("force", t1, t2)
end

keymap.set({ "n" },      "<leader>tb",  "<cmd>Telescope buffers<cr>",                             table_merge({}, { desc = "Telescope: buffers" }))
keymap.set({ "n" },      "<leader>td",  "<cmd>Telescope diagnostics<cr>",                         table_merge({}, { desc = "Telescope: diagnostics" }))
keymap.set({ "n" },      "<leader>tg",  "<cmd>Telescope live_grep_args<cr>",                      table_merge({}, { desc = "Telescope: live grep args" }))
keymap.set({ "n" },      "<leader>tm",  "<cmd>Telescope marks<cr>",                               table_merge({}, { desc = "Telescope: marks" }))
keymap.set({ "n" },      "]b",          "<cmd>bnext<cr>",                                         table_merge({}, { desc = "Buffer: next" }))
keymap.set({ "n" },      "[b",          "<cmd>bprevious<cr>",                                     table_merge({}, { desc = "Buffer: previous" }))
keymap.set({ "n" },      "f",           "<cmd>HopPattern<cr>",                                    table_merge({}, { desc = "Hop: by pattern" }))
keymap.set({ "n" },      "F",           "<cmd>HopWord<cr>",                                       table_merge({}, { desc = "Hop: by word" }))
keymap.set({ "n" },      "]c",          "<cmd>Gitsigns next_hunk<cr>",                            table_merge({}, { desc = "Gitsigns: next hunk" }))
keymap.set({ "n" },      "[c",          "<cmd>Gitsigns prev_hunk<cr>",                            table_merge({}, { desc = "Gitsigns: previous hunk" }))
keymap.set({ "o", "x" }, "ih",          ":<C-U>Gitsigns select_hunk<cr>",                         table_merge({}, { desc = "Gitsigns: select hunk" }))
keymap.set({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<cr>",                               table_merge({}, { desc = "Gitsigns: reset hunk" }))
keymap.set({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<cr>",                               table_merge({}, { desc = "Gitsigns: stage hunk" }))
keymap.set({ "n" },      "<leader>ghu", "<cmd>Gitsigns undo_stage_hunk<cr>",                      table_merge({}, { desc = "Gitsigns: undo stage hunk" }))
keymap.set({ "n" },      "<leader>ghp", "<cmd>Gitsigns preview_hunk<cr>",                         table_merge({}, { desc = "Gitsigns: preview hunk" }))
keymap.set({ "n" },      "<leader>gbS", "<cmd>Gitsigns stage_buffer<cr>",                         table_merge({}, { desc = "Gitsigns: stage buffer" }))
keymap.set({ "n" },      "<leader>gbR", "<cmd>Gitsigns reset_buffer<cr>",                         table_merge({}, { desc = "Gitsigns: reset buffer" }))
keymap.set({ "n" },      "<leader>gb",  "<cmd>Gitsigns blame_line<cr>",                           table_merge({}, { desc = "Gitsigns: blame line" }))
keymap.set({ "n" },      "<leader>gB",  "<cmd>lua require('gitsigns').blame_line{full=true}<cr>", table_merge({}, { desc = "Gitsigns: blame line full" }))
keymap.set({ "n" },      "<leader>gd",  "<cmd>Gitsigns diffthis<cr>",                             table_merge({}, { desc = "Gitsigns: diff this" }))
keymap.set({ "n" },      "<leader>gD",  "<cmd>lua require('gitsigns').diffthis('~')<cr>",         table_merge({}, { desc = "Gitsigns: diff this ~" }))
keymap.set({ "n" },      "<leader>gtb", "<cmd>Gitsigns toggle_current_line_blame<cr>",            table_merge({}, { desc = "Gitsigns: toggle current line blame" }))
keymap.set({ "n" },      "<leader>gtd", "<cmd>Gitsigns toggle_deleted<cr>",                       table_merge({}, { desc = "Gitsigns: toggle deleted" }))
keymap.set({ "n" },      "<leader>gtw", "<cmd>Gitsigns toggle_word_diff<cr>",                     table_merge({}, { desc = "Gitsigns: toggle word diff" }))
keymap.set({ "n" },      "<leader>gtl", "<cmd>Gitsigns toggle_linehl<cr>",                        table_merge({}, { desc = "Gitsigns: toggle line highlight" }))
keymap.set({ "n" },      "<space>q",    diagnostic.setloclist,                                    table_merge({}, { desc = "Diagnostic: setloclist" }))
keymap.set({ "n" },      "<space>e",    diagnostic.open_float,                                    table_merge({}, { desc = "Diagnostic: open float" }))
keymap.set({ "n" },      "[d",          diagnostic.goto_prev,                                     table_merge({}, { desc = "Diagnostic: go to previous" }))
keymap.set({ "n" },      "]d",          diagnostic.goto_next,                                     table_merge({}, { desc = "Diagnostic: go to next" }))

-- Use LspAttach autocommand to only map the following keys after the language server attaches to the current buffer
api.nvim_create_autocmd({ "LspAttach" }, {
	group = api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		bufferOpts[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = {
			buffer = ev.buf,
		}
		keymap.set({ "n" }, "<leader>lgD", lsp.buf.declaration,             table_merge(opts, { desc = "Lsp: go to declaration" }))
		keymap.set({ "n" }, "<leader>lgd", lsp.buf.definition,              table_merge(opts, { desc = "Lsp: go to definition" }))
		keymap.set({ "n" }, "<leader>lgi", lsp.buf.implementation,          table_merge(opts, { desc = "Lsp: go to implementation" }))
		keymap.set({ "n" }, "<leader>lgr", lsp.buf.references,              table_merge(opts, { desc = "Lsp: go to references" }))
		keymap.set({ "n" }, "K",           lsp.buf.hover,                   table_merge(opts, { desc = "Lsp: hover" }))
		keymap.set({ "n" }, "<C-k>",       lsp.buf.signature_help,          table_merge(opts, { desc = "Lsp: signature help" }))
		keymap.set({ "n" }, "<space>wa",   lsp.buf.add_workspace_folder,    table_merge(opts, { desc = "Lsp: add workspace folder" }))
		keymap.set({ "n" }, "<space>wr",   lsp.buf.remove_workspace_folder, table_merge(opts, { desc = "Lsp: remove workspace folder" }))
		keymap.set({ "n" }, "<space>wl",   function()
			print(inspect(lsp.buf.list_workspace_folders()))
		end, table_merge(opts, { desc = "Lsp: list workspace folders" }))
		keymap.set({ "n" }, "<space>d",    lsp.buf.type_definition, table_merge(opts, { desc = "Lsp: type definition" }))
		keymap.set({ "n" }, "<space>r",    lsp.buf.rename,          table_merge(opts, { desc = "Lsp: rename" }))
		keymap.set({ "n" }, "<space>f",    function()
			lsp.buf.format { async = true }
		end, table_merge(opts, { desc = "Lsp: format" }))
	end,
})
