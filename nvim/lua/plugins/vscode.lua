return {
	'Mofiqul/vscode.nvim',
	priority = 9000,
	config = function ()
		local vscode = require('vscode')
		vscode.setup {
			italic_comments     = true,
			disable_nvimtree_bg = true,
			transparent         = false,
		}
		vscode.load()
	end
}
