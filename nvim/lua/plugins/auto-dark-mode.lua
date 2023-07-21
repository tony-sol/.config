return {
	'f-person/auto-dark-mode.nvim',
	priority = 1000,
	config = function ()
		local auto_dark_mode = require('auto-dark-mode')
		auto_dark_mode.setup {
			update_interval = 500,
		}
		auto_dark_mode.init()
	end
}
