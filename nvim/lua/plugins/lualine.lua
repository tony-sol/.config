return {
	'nvim-lualine/lualine.nvim',
	dependencies = {
		{
			'nvim-tree/nvim-web-devicons',
		},
		{
			'Bekaboo/dropbar.nvim',
		},
	},
	config       = function()
		local lualine = require('lualine')
		local utils   = require('utils')
		local section = {
			lualine_a = {
				'mode',
			},
			lualine_b = {
				'branch',
				'diff',
				'diagnostics',
			},
			lualine_c = {
				{
					'filename',
					path           = 3,
					newfile_status = true,
				},
			},
			lualine_x = {
				'encoding',
				'fileformat',
				'filetype',
			},
			lualine_y = {
				'progress',
			},
			lualine_z = {
				'location',
				'selectioncount',
			}
		}
		local function breadcrumbs()
			-- '%{%v:lua.dropbar.get_dropbar_str()%}'
			---@diagnostic disable-next-line:undefined-global
			return dropbar.get_dropbar_str()
		end
		lualine.setup {
			options           = {
				icons_enabled        = true,
				component_separators = { left = '', right = '' },
				section_separators   = { left = '', right = '' },
				disabled_filetypes   = {
					statusline = {
					},
					winbar     = {
						'',
						'NvimTree',
						'Outline',
						'Trouble',
					},
				},
			},
			sections          = section,
			inactive_sections = utils.merge(
				section,
				{
					lualine_b = {},
					lualine_x = {},
				}
			),
			tabline           = {
				lualine_a = {
					{
						'buffers',
						mode            = 4,
						use_mode_colors = true,
					},
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
					{
						'tabs',
						mode            = 2,
						use_mode_colors = true,
					},
				}
			},
			winbar            = {
				lualine_a = {
				},
				lualine_b = {
				},
				lualine_c = {
					breadcrumbs,
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
					breadcrumbs,
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
				'lazy',
				'mason',
				'nvim-tree',
				'nvim-dap-ui',
				'symbols-outline',
				'trouble',
			},
		}
	end
}
