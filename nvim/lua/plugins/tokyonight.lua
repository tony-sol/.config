return {
	'folke/tokyonight.nvim',
	priority = 9000,
	lazy     = false,
	config   = function()
		local tokyonight = require('tokyonight')
		tokyonight.setup {
			style           = 'night',
			light_style     = 'day',
			transparent     = false,
			terminal_colors = true,
			styles          = {
				comments  = {
					italic = true,
				},
				keywords  = {
					italic = true,
				},
				functions = {},
				variables = {},
				-- Background styles. Can be "dark", "transparent" or "normal"
				sidebars  = 'normal',
				floats    = 'normal',
			},
			day_brightness  = 0.3,
			dim_inactive    = false,
			lualine_bold    = true,
			cache           = false,
		}
		tokyonight.load()
	end
}
