-- @see https://wiki.hypr.land/Configuring/Start/

---@diagnostic disable-next-line:undefined-global
local hyprland = hl

------------------
---- MONITORS ----
------------------

-- @See https://wiki.hypr.land/Configuring/Basics/Monitors/
hyprland.monitor({
	output   = "",
	mode     = "3840x2160@120",
	position = "auto",
	scale    = 1.25,
	bitdepth = 10
})


-------------------
---- AUTOSTART ----
-------------------

-- @See https://wiki.hypr.land/Configuring/Basics/Autostart/

require('land/autostarts')


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- @See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

require('land/environment')


-----------------------
----- PERMISSIONS -----
-----------------------

-- @See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/

require('land/permissions')


-------------------
---- VARIABLES ----
-------------------

-- @See https://wiki.hypr.land/Configuring/Basics/Variables/
hyprland.config({
	general = {
		border_size             = 2,
		gaps_in                 = 4,
		gaps_out                = 4,
		float_gaps              = 0,
		gaps_workspaces         = 0,
		col                     = {
			active_border         = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			inactive_border       = "rgba(595959aa)",
			nogroup_border        = "rgba(ffaaffff)",
			nogroup_border_active = "rgba(ff00ffff)",
		},
		layout                  = "dwindle",
		no_focus_fallback       = false,
		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border        = true,
		extend_border_grab_area = 15,
		hover_icon_on_border    = true,
		-- Please @see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing           = false,
		resize_corner           = 0,
		modal_parent_blocking   = true,
		snap                    = {
			enabled = true,
			window_gap = 10,
			monitor_gap = 10,
			border_overlap = false,
			respect_gaps = true,
		},
	},
	-- @See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
	dwindle = {
		preserve_split = true,
	},
	-- @See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
	master = {
		new_status = "master",
	},
	xwayland = {
		enabled = true,
		force_zero_scaling = false,
	},
	-- @See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
	scrolling = {
		fullscreen_on_one_column = true,
	},
})

require('land/animations')
require('land/decorations')


---------------
---- INPUT ----
---------------

-- @See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more

require('land/inputs')


---------------------
---- KEYBINDINGS ----
---------------------

require('land/binds')


-----------------
---- PLUGINS ----
-----------------

require('land/plugins')


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- @See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- @Seettps://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

-- local suppressMaximizeRule = hyprland.window_rule({
-- 	-- Ignore maximize requests from all apps. You'll probably like this.
-- 	name           = "suppress-maximize-events",
-- 	match          = { class = ".*" },

-- 	suppress_event = "maximize",
-- })
-- suppressMaximizeRule:set_enabled(false)

hyprland.window_rule({
	-- Fix some dragging issues with XWayland
	name     = "fix-xwayland-drags",
	match    = {
		class      = "^$",
		title      = "^$",
		xwayland   = true,
		float      = true,
		fullscreen = false,
		pin        = false,
	},
	no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)
