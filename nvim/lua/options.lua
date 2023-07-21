local opt = vim.opt

local function scheme_for_appearance(appearance)
	local style = 'Dark'
	return string.lower(appearance:find(style) and style or 'Light')
end

opt.fillchars:append('foldopen:<')
opt.fillchars:append('foldclose:>')
opt.listchars:append('space:⋅')
opt.listchars:append('eol:↴')
opt.background     = scheme_for_appearance(appearance())
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
opt.foldcolumn     = '1'
opt.foldlevel      = 99
opt.foldlevelstart = 99
opt.foldenable     = true
