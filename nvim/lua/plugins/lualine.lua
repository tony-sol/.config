return {
	'nvim-lualine/lualine.nvim',
	dependencies = {
		{
			'nvim-tree/nvim-web-devicons',
		},
	},
	config       = function()
		local lualine = require('lualine')
		lualine.setup {
			options           = {
				icons_enabled        = true,
				component_separators = { left = '', right = '' },
				section_separators   = { left = '', right = '' },
				disabled_filetypes   = {
					statusline = {},
					winbar     = { '', 'NvimTree', 'Outline' },
				},
				always_divide_middle = true,
				globalstatus         = true,
			},
			sections          = {
				lualine_a = {
					{ 'mode' },
				},
				lualine_b = {
					{ 'branch' },
					{ 'diff' },
					{ 'diagnostics' },
				},
				lualine_c = {
					{ 'filename', path = 3 },
				},
				lualine_x = {
					{ 'encoding' },
					{ 'fileformat' },
					{ 'filetype' },
				},
				lualine_y = {
					{ 'progress' },
				},
				lualine_z = {
					{ 'location' },
				}
			},
			inactive_sections = {
				lualine_a = {
					{ 'mode' },
				},
				lualine_b = {
				},
				lualine_c = {
					{ 'filename', path = 3 },
				},
				lualine_x = {
				},
				lualine_y = {
					{ 'progress' },
				},
				lualine_z = {
					{ 'location' },
				}
			},
			tabline           = {
				lualine_a = {
					{ 'buffers', mode = 4, use_mode_colors = true },
				},
				lualine_b = {
				},
				lualine_c = {
				},
				lualine_x = {
				},
				lualine_y = {
				},
				lualine_z = {
					{ 'tabs', mode = 0, use_mode_colors = true },
				}
			},
			winbar            = {
				lualine_a = {
				},
				lualine_b = {
				},
				lualine_c = {
				},
				lualine_x = {
				},
				lualine_y = {
				},
				lualine_z = {
				}
			},
			inactive_winbar   = {
				lualine_a = {
				},
				lualine_b = {
				},
				lualine_c = {
				},
				lualine_x = {
				},
				lualine_y = {
				},
				lualine_z = {
				}
			},
			extensions        = {
				'fzf',
				'nvim-tree',
				'nvim-dap-ui',
				'trouble',
			},
		}
	end
}
