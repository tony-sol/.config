---@diagnostic disable: undefined-global
local api = vim.api
local cmd = vim.cmd
local fn  = vim.fn
---@diagnostic enable: undefined-global

api.nvim_create_autocmd({ 'BufWritePre' }, {
	desc     = 'Trim trailing whitespaces before write into buffer',
	pattern  = { '*' },
	callback = function()
		local view = fn.winsaveview()
		cmd([[%s/\s\+$//e]])
		fn.winrestview(view)
	end,
})
