local opt   = vim.opt
local utils = require('utils')

-- Appearance settings
opt.background     = utils.appearance()
opt.termguicolors  = true
opt.cursorline     = true
opt.laststatus     = 3

-- Fill chars
opt.fillchars      =  utils.defaultFillchars()

-- List settings
opt.list           = true
opt.listchars      = {
	tab   = ' ',
	trail = '-',
	nbsp  = '+',
	space = '·',
	eol   = '↴',
}

-- Indent settings
opt.tabstop        = 4
opt.softtabstop    = 0
opt.shiftwidth     = 4
opt.smarttab       = true
opt.smartindent    = true

-- Scroll settings
opt.scrolloff      = 10

-- Wrap settings
opt.linebreak      = false

-- Fold settings
opt.foldcolumn     = 'auto'
opt.foldlevel      = 99
opt.foldlevelstart = 99
opt.foldenable     = true

-- Split settings
opt.splitright     = true
opt.splitbelow     = true
opt.splitkeep      = 'screen'

-- Search settings
opt.smartcase      = true
opt.hlsearch       = true

-- Columns settings
opt.relativenumber = true
opt.number         = true
opt.signcolumn     = 'yes'
opt.statuscolumn   = ''

-- Mouse settings
opt.mouse          = 'a'
opt.mousemodel     = 'popup_setpos'

opt.updatetime     = 100
