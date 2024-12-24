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
		local noice   = require('noice')
		local utils   = require('utils')
		---@return string
		local function breadcrumbs()
			-- '%{%v:lua.dropbar()%}'
			---@diagnostic disable-next-line:undefined-global
			return dropbar()
		end
		local section = {
			lualine_a = {
				'mode',
				{
					noice.api.status.mode.get,
					cond = noice.api.status.mode.has
				}
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
		local winbar  = {
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
				{
					noice.api.status.search.get,
					cond = noice.api.status.search.has,
				},
			}
		}
		local tabline = {
			lualine_a = {
				{
					'buffers',
					mode = 4,
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
					mode = 2,
				},
			}
		}
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
			inactive_sections = utils.merge(section, {
				lualine_b = {},
				lualine_x = {},
			}),
			winbar            = winbar,
			inactive_winbar   = utils.merge(winbar, {
			}),
			tabline           = tabline,
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
