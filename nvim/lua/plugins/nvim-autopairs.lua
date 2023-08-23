return {
	'windwp/nvim-autopairs',
	config = function()
		local nvim_autopairs = require('nvim-autopairs')
		nvim_autopairs.setup {
			disable_in_macro = true,
			check_ts         = true,
		}
	end
}
