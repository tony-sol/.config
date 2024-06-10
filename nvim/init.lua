require('globals')
require('options')

---@diagnostic disable: undefined-global
local fn     = vim.fn
local loader = vim.loader
local loop   = vim.loop
local opt    = vim.opt
---@diagnostic enable: undefined-global
local utils  = require('utils')

loader.enable()
local lazypath = fn.stdpath('data') .. '/lazy/lazy.nvim'
if not loop.fs_stat(lazypath) then
	fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'--single-branch',
		'https://github.com/folke/lazy.nvim.git',
		lazypath
	})
end
opt.runtimepath:prepend(lazypath)

require('lazy').setup('plugins', {
	install = {
		colorscheme = { 'vscode' },
	},
	ui      = {
		border = 'rounded',
		size   = utils.defaultModalSize(),
	},
	diff    = {
		cmd = 'diffview.nvim',
	},
})
require('filetypes')
require('keymaps')
