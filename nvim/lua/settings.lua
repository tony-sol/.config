local cmd  = vim.cmd           -- execute Vim commands
local exec = vim.api.nvim_exec -- execute Vimscript
local g    = vim.g             -- global variables
local opt  = vim.opt           -- global/buffer/windows-scoped

opt.listchars:append('space:⋅')

g.vscode_style               = 'dark'
g.vscode_transparent         = true
g.vscode_italic_comment      = true
g.vscode_disable_nvimtree_bg = true
opt.termguicolors            = false

opt.list           = true
opt.cursorline     = true
opt.number         = true
opt.relativenumber = true
opt.tabstop        = 4
opt.softtabstop    = 0
opt.shiftwidth     = 4
opt.smarttab       = true
opt.smartindent    = true
opt.clipboard      = 'unnamedplus'
