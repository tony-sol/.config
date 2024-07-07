return {
	'Mofiqul/vscode.nvim',
	priority = 9001,
	lazy     = false,
	config   = function()
		local vscode = require('vscode')
		vscode.setup {
			transparent         = true,
			italic_comments     = true,
			underline_links     = true,
			disable_nvimtree_bg = true,
		}
		vscode.load()
	end
}
