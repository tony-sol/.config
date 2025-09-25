local M = {}

function M.init()
	---@diagnostic disable: undefined-global
	local api  = vim.api
	local cmd  = vim.cmd
	local fn   = vim.fn
	local lsp  = vim.lsp
	---@diagnostic enable: undefined-global
	local keys = require('keymaps')

	api.nvim_create_autocmd({ 'BufWritePre' }, {
		desc     = 'Trim trailing whitespaces before write into buffer',
		pattern  = { '*' },
		callback = function()
			local view = fn.winsaveview()
			cmd([[%s/\s\+$//e]])
			fn.winrestview(view)
		end,
	})

	api.nvim_create_autocmd({ 'LspAttach' }, {
		desc     = 'Enable lsp completion',
		group    = api.nvim_create_augroup('UserLspAttach', {}),
		callback = function(ev)
			lsp.completion.enable(true, ev.data.client_id, ev.buf)
		end,
	})

	api.nvim_create_autocmd({ 'LspAttach' }, {
		desc     = 'Map keys only after the language server attaches to the current buffer',
		group    = api.nvim_create_augroup('UserLspAttach', {}),
		callback = keys.on_lsp_attach
	})
end

return M
