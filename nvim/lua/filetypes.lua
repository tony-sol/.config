---@diagnostic disable-next-line: undefined-global
local filetype = vim.filetype

filetype.add {
	pattern = {
		-- homebrew brewfile
		['[bB]rewfile']                  = 'ruby',
		-- kubernetes config
		['.*%/kube%/config']             = 'yaml',
		['.*%/kube%/.*%.config']         = 'yaml',
		-- terraform | tofu
		['.*%.tfrc']                     = 'terraform',
		['.*%.terraformrc']              = 'terraform',
		['.*%/tofurc']                   = 'terraform',
		-- json lock
		['.*%.json%.lock']               = 'json',
		-- vscode jsonc
		['.*%.code%-workspace']          = 'jsonc',
		['.*%/.vscode%/.*%.json']        = 'jsonc',
		-- podman machine ignition
		['.*%.ign']                      = 'json',
		-- vial layout
		['.*%.vil']                      = 'json',
		-- ssh config
		-- @todo optimize
		['.*%/.*%.?ssh%.config']         = 'sshconfig',
		['.*%/.*%.?ssh%/config']         = 'sshconfig',
		['.*%/.*%.?ssh%/.*%.config']     = 'sshconfig',
		['.*%/.*%.?ssh%/.*%/config']     = 'sshconfig',
		['.*%/.*%.?ssh%/.*%/.*%.config'] = 'sshconfig',
	},
}
