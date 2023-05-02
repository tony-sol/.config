local opt = vim.opt -- global/buffer/windows-scoped

opt.listchars:append('space:⋅')
opt.listchars:append('eol:↴')
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
opt.ignorecase     = true
opt.smartcase      = true
opt.smartindent    = true
opt.hlsearch       = true
opt.splitright     = true
