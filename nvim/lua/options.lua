---@diagnostic disable: undefined-global
local g            = vim.g
local opt          = vim.opt
---@diagnostic enable: undefined-global
local utils        = require('utils')

-- Setup <leader> key
g.mapleader         = '\\'
g.maplocalleader    = '\\'

-- Appearance settings
opt.background     = utils.appearance()
opt.termguicolors  = true
opt.cursorline     = true
opt.cursorcolumn   = false
opt.laststatus     = 3

-- Fill chars
opt.fillchars      = utils.defaultFillchars()

-- List settings
opt.list           = true
opt.listchars      = utils.defaultListchars()

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

-- Columns settings
opt.relativenumber = true
opt.number         = true
opt.numberwidth    = 1
opt.foldcolumn     = 'auto:9'
opt.signcolumn     = 'auto:1-9'
opt.statuscolumn   = ''

-- Fold settings
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

-- Mouse settings
opt.mouse          = 'a'
opt.mousemodel     = 'popup_setpos'

opt.updatetime     = 100
opt.showmode       = false
