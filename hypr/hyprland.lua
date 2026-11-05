-- @see https://wiki.hypr.land/Configuring/Start/

---@diagnostic disable-next-line:undefined-global
local hyprland = hl
local colors   = require('utils.colors')

require('land/environment')
require('land/permissions')
require('land/hooks')
require('land/monitors')

hyprland.config({
	general = {
		border_size             = 2,
		gaps_in                 = 4,
		gaps_out                = 4,
		float_gaps              = 0,
		gaps_workspaces         = 0,
		col                     = {
			active_border         = { colors = { colors.cyan, colors.green }, angle = 45 },
			inactive_border       = colors.gray,
			nogroup_border        = colors.magenta,
			nogroup_border_active = colors.magenta_bright,
		},
		layout                  = "scrolling",
		no_focus_fallback       = false,
		resize_on_border        = true,
		extend_border_grab_area = 15,
		hover_icon_on_border    = true,
		allow_tearing           = false,
		resize_corner           = 0,
		modal_parent_blocking   = true,
		snap                    = {
			enabled        = true,
			window_gap     = 10,
			monitor_gap    = 10,
			border_overlap = false,
			respect_gaps   = true,
		},
	},
	xwayland = {
		enabled = true,
		force_zero_scaling = false,
	},
	scrolling = {
		fullscreen_on_one_column = true,
		column_width             = 0.5,
		focus_fit_method         = 1,
		follow_focus             = 1,
		follow_min_visible       = 0.2,
		explicit_column_widths   = "0.333, 0.5, 0.667, 1.0",
		wrap_focus               = true,
		wrap_swapcol             = true,
		direction                = 'right'
	},
	animations = {
		enabled = true,
	},
	decoration = {
		rounding              = 10,
		rounding_power        = 2,
		active_opacity        = 1.0,
		inactive_opacity      = 1.0,
		fullscreen_opacity    = 1.0,
		dim_modal             = true,
		dim_inactive          = false,
		dim_strength          = 0.5,
		dim_special           = 0.2,
		dim_around            = 0.4,
		screen_shader         = "",
		border_part_of_window = true,
		blur                  = {
			enabled                   = true,
			size                      = 3,
			passes                    = 1,
			ignore_opacity            = true,
			new_optimizations         = true,
			xray                      = false,
			noise                     = 0.0117,
			contrast                  = 0.8916,
			brightness                = 0.8172,
			vibrancy                  = 0.1696,
			vibrancy_darkness         = 0.0,
			special                   = false,
			popups                    = false,
			popups_ignorealpha        = 0.2,
			input_methods             = false,
			input_methods_ignorealpha = 0.2,
		},
		shadow                = {
			enabled      = true,
			range        = 4,
			render_power = 3,
			sharp        = false,
			color        = colors.black,
			offset       = "0, 0",
			scale        = 1.0,
		},
	},
	input = {
		kb_layout    = "us,ru",
		kb_variant   = "",
		kb_model     = "",
		kb_options   = "grp:alt_shift_toggle",
		kb_rules     = "",
		follow_mouse = 1,
		sensitivity  = 0, -- -1.0 - 1.0, 0 means no modification.
		touchpad     = {
			natural_scroll = false,
		},
	},
	ecosystem = {
		enforce_permissions = true,
	},
})

require('land/animations')
require('land/windows_rules')
require('land/inputs')
require('land/binds')
require('land/plugins')
