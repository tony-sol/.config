local opt = vim.opt

local function scheme_for_appearance(appearance)
	local style = 'Dark'
	return string.lower(appearance:find(style) and style or 'Light')
end

-- Appearance settings
opt.background     = scheme_for_appearance(appearance())
opt.termguicolors  = true
opt.cursorline     = true

-- Fill chars
opt.fillchars      = {
	vert      = '│',
	foldopen  = '-',
	foldsep   = '│',
	foldclose = '+',
}

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
opt.number         = false
opt.signcolumn     = 'yes'
opt.statuscolumn   = ''

-- Mouse settings
opt.mouse          = 'a'
opt.mousemodel     = 'popup_setpos'

opt.updatetime     = 100
