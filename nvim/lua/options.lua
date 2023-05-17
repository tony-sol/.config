local opt = vim.opt

-- @todo make it not only for Darwin
local function get_appearance()
	local result, _ = require("plenary.job"):new({
		enable_recording = true,
		command = "defaults",
		args    = { "read", "-g", "AppleInterfaceStyle" },
	}):sync()
	return result[1] or ""
end

local function scheme_for_appearance(appearance)
	local style = "Dark"
	if not appearance:find(style) then
		style = "Light"
	end
	return string.lower(style)
end

opt.listchars:append('space:⋅')
opt.listchars:append('eol:↴')
opt.termguicolors  = true
opt.background     = scheme_for_appearance(get_appearance())
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
