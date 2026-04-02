return {
	'nvim-lualine/lualine.nvim',
	dependencies = {
		{
			'nvim-tree/nvim-web-devicons',
		},
	},
	config       = function()
		---@diagnostic disable-next-line: undefined-global
		local fn       = vim.fn
		local lualine  = require('lualine')
		local noice    = require('noice')
		local utils    = require('utils')
		local ftypes   = {
			NvimTree        = 'NvimTree',
			Outline         = 'Outline',
			TelescopePrompt = 'Telescope',
			fzf             = 'Fzf',
			noice           = 'Noice',
			trouble         = 'Trouble',
		}
		local sections = {
			lualine_a = {
				'mode',
				{
					noice.api.status.mode.get,
					cond = noice.api.status.mode.has
				},
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
				{
					noice.api.status.search.get,
					cond = noice.api.status.search.has,
				},
				{
					'encoding',
					show_bomb = true,
				},
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
		local tabline  = {
			lualine_a = {
				{
					'windows',
					mode              = 2,
					filetype_names    = ftypes,
					disabled_buftypes = {
					},
				},
			},
			lualine_b = {
				{
					'buffers',
					mode           = 4,
					filetype_names = ftypes,
				},
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
					path = 1,
					---@diagnostic disable-next-line: unused-local
					fmt = function(name, context)
						return fn.fnamemodify(fn.getcwd(fn.tabpagewinnr(context.tabnr), context.tabnr), ':~')
					end
				},
			}
		}
		local winbar   = {
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
		}
		lualine.setup {
			options           = {
				disabled_filetypes = {
					statusline = {
					},
					winbar     = {
						'',
						'NvimTree',
						'Outline',
						'noice',
						'qf',
						'trouble',
						-- @todo fetch ftypes from require('kubectl')
						'k8s_deployments',
						'k8s_pods',
						'k8s_configmaps',
						'k8s_secrets',
						'k8s_services',
						'k8s_ingresses',
					},
				},
			},
			sections          = sections,
			inactive_sections = utils.merge(sections, {
				lualine_b = {},
				lualine_x = {},
			}),
			tabline           = tabline,
			winbar            = winbar,
			inactive_winbar   = utils.merge(winbar, {
				lualine_a = {
				},
			}),
			extensions        = {
				'fzf',
				'lazy',
				'man',
				'mason',
				'nvim-dap-ui',
				'nvim-tree',
				'quickfix',
				'symbols-outline',
				'trouble',
			},
		}
	end
}
