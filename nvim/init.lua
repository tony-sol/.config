require('globals')
require('helpers')
require('options')

local fn     = vim.fn
local loader = vim.loader
local loop   = vim.loop
local opt    = vim.opt

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
		size   = defaultModalSize(),
	},
	diff    = {
		cmd = 'diffview.nvim',
	},
})
require('keymaps')
