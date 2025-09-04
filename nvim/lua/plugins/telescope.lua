return {
	'nvim-telescope/telescope.nvim',
	dependencies = {
		{
			'nvim-telescope/telescope-file-browser.nvim',
		},
		{
			'nvim-telescope/telescope-live-grep-args.nvim',
		},
		{
			'nvim-telescope/telescope-dap.nvim',
		},
		{
			'nvim-telescope/telescope-ui-select.nvim',
		},
		{
			'debugloop/telescope-undo.nvim',
		},
		-- @warn this would mirror kubectl.nvim plugin
		-- @see https://github.com/kezhenxu94/telescope-kubectl.nvim/issues/1
		-- {
		-- 	'kezhenxu94/telescope-kubectl.nvim',
		-- },
		{
			'Marskey/telescope-sg',
		},
		{
			'rest-nvim/rest.nvim',
		},
		{
			'nvim-lua/plenary.nvim',
		},
	},
	event        = 'VimEnter',
	config       = function()
		local utils              = require('utils')
		local telescope          = require('telescope')
		local telescope_config   = require('telescope.config')
		local default_modal_size = utils.defaultModalSize()
		telescope.setup {
			defaults   = {
				scroll_strategy   = 'cycle',
				sorting_strategy  = 'ascending',
				layout_strategy   = 'horizontal',
				layout_config     = {
					horizontal = utils.merge(default_modal_size, {
						prompt_position = 'top',
						preview_width   = default_modal_size.width,
					}),
					vertical   = utils.merge(default_modal_size, {
						prompt_position = 'top',
						preview_height  = default_modal_size.width,
						mirror          = true,
					}),
				},
				vimgrep_arguments = utils.push(telescope_config.values.vimgrep_arguments,
					'--hidden',
					'--no-ignore'
				),
			},
			pickers    = {
				find_files = {
					find_command     = { 'fd' },
					follow           = true,
					hidden           = true,
					no_ignore        = true,
					no_ignore_parent = true,
				},
			},
			extensions = {
				['file_browser']   = {
					prompt_path       = true,
					grouped           = true,
					hidden            = {
						file_browser   = true,
						folder_browser = true,
					},
					respect_gitignore = false,
				},
				['live_grep_args'] = {},
				['dap']            = {},
				['noice']          = {},
				['notify']         = {},
				['todo-comments']  = {},
				['ui-select']      = {},
				['undo']           = {},
				['ast_grep']       = {
					command         = { 'sg', '--json=stream' },
					grep_open_files = false,
					lang            = nil,
				},
				['rest']           = {},
				-- ['kubectl']        = {},
			},
		}
		telescope.load_extension('file_browser')
		telescope.load_extension('live_grep_args')
		telescope.load_extension('dap')
		telescope.load_extension('noice')
		telescope.load_extension('notify')
		telescope.load_extension('todo-comments')
		telescope.load_extension('ui-select')
		telescope.load_extension('undo')
		telescope.load_extension('ast_grep')
		telescope.load_extension('rest')
		-- telescope.load_extension('kubectl')
	end
}
