local cmd  = vim.cmd           -- execute Vim commands
local api  = vim.api           -- execute Vim API method
local exec = vim.api.nvim_exec -- execute Vimscript
local g    = vim.g             -- global variables
local opt  = vim.opt           -- global/buffer/windows-scoped

opt.listchars:append('space:⋅')
opt.termguicolors  = true
opt.signcolumn     = 'yes'
opt.updatetime     = 100
opt.list           = true
opt.cursorline     = true
opt.number         = true
opt.relativenumber = true
opt.tabstop        = 4
opt.softtabstop    = 0
opt.shiftwidth     = 4
opt.smarttab       = true
opt.smartcase      = true
opt.smartindent    = true

g.mapleader                  = '\\'
g.maplocalleader             = '\\'

g.vscode_style               = 'dark'
g.vscode_transparent         = true
g.vscode_italic_comment      = true
g.vscode_disable_nvimtree_bg = true

cmd([[colorscheme vscode]])

vim.diagnostic.config({
	virtual_text = false
})
