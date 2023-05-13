local api         = vim.api
local bufferOpts  = vim.bo
local cmd         = vim.cmd
local diagnostic  = vim.diagnostic
local fn          = vim.fn
local lsp         = vim.lsp
local keymap      = vim.keymap

local table_merge = function(t1, t2)
	return vim.tbl_deep_extend("force", t1, t2)
end
local inspect = vim.inspect

keymap.set({ "n", "v" }, "]b",         "<plug>(CybuNext)",                                       table_merge({}, { desc = "Next buffer" }))
keymap.set({ "n", "v" }, "[b",         "<plug>(CybuPrev)",                                       table_merge({}, { desc = "Previous buffer" }))
keymap.set({ "n" },      "<leader>ga", "<cmd>lua require('cosmic-ui').code_actions()<cr>",       table_merge({}, { desc = "Code actions" }))
keymap.set({ "v" },      "<leader>ga", "<cmd>lua require('cosmic-ui').range_code_actions()<cr>", table_merge({}, { desc = "Range code actions" }))

api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function(data)
		if fn.isdirectory(data.file) ~= 1 then
			return
		end
		cmd.cd(data.file)
		require("nvim-tree.api").tree.open()
	end
})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
keymap.set({ "n" }, "<space>q", diagnostic.setloclist, table_merge({}, { desc = "Diagnostic: setloclist" }))
keymap.set({ "n" }, "<space>e", diagnostic.open_float, table_merge({}, { desc = "Diagnostic: open float" }))
keymap.set({ "n" }, "[d",       diagnostic.goto_prev,  table_merge({}, { desc = "Diagnostic: go to previous" }))
keymap.set({ "n" }, "]d",       diagnostic.goto_next,  table_merge({}, { desc = "Diagnostic: go to next" }))

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
api.nvim_create_autocmd("LspAttach", {
	group = api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		bufferOpts[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = {
			buffer = ev.buf,
		}
		keymap.set({ "n" }, "<leader>gD", lsp.buf.declaration,             table_merge(opts, { desc = "Lsp: go to declaration" }))
		keymap.set({ "n" }, "<leader>gd", lsp.buf.definition,              table_merge(opts, { desc = "Lsp: go to definition" }))
		keymap.set({ "n" }, "<leader>gi", lsp.buf.implementation,          table_merge(opts, { desc = "Lsp: go to implementation" }))
		keymap.set({ "n" }, "<leader>gr", lsp.buf.references,              table_merge(opts, { desc = "Lsp: go to references" }))
		keymap.set({ "n" }, "K",          lsp.buf.hover,                   table_merge(opts, { desc = "Lsp: hover" }))
		keymap.set({ "n" }, "<C-k>",      lsp.buf.signature_help,          table_merge(opts, { desc = "Lsp: signature help" }))
		keymap.set({ "n" }, "<space>wa",  lsp.buf.add_workspace_folder,    table_merge(opts, { desc = "Lsp: add workspace folder" }))
		keymap.set({ "n" }, "<space>wr",  lsp.buf.remove_workspace_folder, table_merge(opts, { desc = "Lsp: remove workspace folder" }))
		keymap.set({ "n" }, "<space>wl",  function()
			print(inspect(lsp.buf.list_workspace_folders()))
		end, table_merge(opts, { desc = "Lsp: list workspace folders" }))
		keymap.set({ "n" }, "<space>D",  lsp.buf.type_definition, table_merge(opts, { desc = "Lsp: type definition" }))
		keymap.set({ "n" }, "<space>rn", lsp.buf.rename,          table_merge(opts, { desc = "Lsp: code action" }))
		keymap.set({ "n" }, "<space>f",  function()
			lsp.buf.format { async = true }
		end, table_merge(opts, { desc = "Lsp: format" }))
	end,
})
