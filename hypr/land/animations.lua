---@diagnostic disable-next-line:undefined-global
local hyprland = hl

local curve = {
	easeOutQuint   = "easeOutQuint",
	easeInOutCubic = "easeInOutCubic",
	linear         = "linear",
	almostLinear   = "almostLinear",
	quick          = "quick",
	easy           = "easy",
}

hyprland.curve(curve.easeOutQuint, {
	type   = "bezier",
	points = {
		{ 0.23, 1 },
		{ 0.32, 1 }
	},
})
hyprland.curve(curve.easeInOutCubic, {
	type   = "bezier",
	points = {
		{ 0.65, 0.05 },
		{ 0.36, 1 }
	},
})
hyprland.curve(curve.linear, {
	type   = "bezier",
	points = {
		{ 0, 0 },
		{ 1, 1 }
	},
})
hyprland.curve(curve.almostLinear, {
	type   = "bezier",
	points = {
		{ 0.5,  0.5 },
		{ 0.75, 1 }
	},
})
hyprland.curve(curve.quick, {
	type   = "bezier",
	points = {
		{ 0.15, 0 },
		{ 0.1,  1 }
	},
})
hyprland.curve(curve.easy, {
	type      = "spring",
	mass      = 1,
	stiffness = 71.2633,
	dampening = 15.8273644,
})

hyprland.animation({
	leaf    = "global",
	enabled = true,
	speed   = 10,
	bezier  = "default",
})
hyprland.animation({
	leaf    = "border",
	enabled = true,
	speed   = 5.39,
	bezier  = curve.easeOutQuint,
})
hyprland.animation({
	leaf    = "windows",
	enabled = true,
	speed   = 4.79,
	spring  = curve.easy,
})
hyprland.animation({
	leaf    = "windowsIn",
	enabled = true,
	speed   = 4.1,
	spring  = curve.easy,
	style   = "popin 87%",
})
hyprland.animation({
	leaf    = "windowsOut",
	enabled = true,
	speed   = 1.49,
	bezier  = curve.linear,
	style   = "popin 87%",
})
hyprland.animation({
	leaf    = "fadeIn",
	enabled = true,
	speed   = 1.73,
	bezier  = curve.almostLinear,
})
hyprland.animation({
	leaf    = "fadeOut",
	enabled = true,
	speed   = 1.46,
	bezier  = curve.almostLinear,
})
hyprland.animation({
	leaf    = "fade",
	enabled = true,
	speed   = 3.03,
	bezier  = curve.quick,
})
hyprland.animation({
	leaf    = "layers",
	enabled = true,
	speed   = 3.81,
	bezier  = curve.easeOutQuint,
})
hyprland.animation({
	leaf    = "layersIn",
	enabled = true,
	speed   = 4,
	bezier  = curve.easeOutQuint,
	style   = "fade",
})
hyprland.animation({
	leaf    = "layersOut",
	enabled = true,
	speed   = 1.5,
	bezier  = curve.linear,
	style   = "fade",
})
hyprland.animation({
	leaf    = "fadeLayersIn",
	enabled = true,
	speed   = 1.79,
	bezier  = curve.almostLinear,
})
hyprland.animation({
	leaf    = "fadeLayersOut",
	enabled = true,
	speed   = 1.39,
	bezier  = curve.almostLinear,
})
hyprland.animation({
	leaf    = "workspaces",
	enabled = true,
	speed   = 1.94,
	bezier  = curve.almostLinear,
	style   = "fade",
})
hyprland.animation({
	leaf    = "workspacesIn",
	enabled = true,
	speed   = 1.21,
	bezier  = curve.almostLinear,
	style   = "fade",
})
hyprland.animation({
	leaf    = "workspacesOut",
	enabled = true,
	speed   = 1.94,
	bezier  = curve.almostLinear,
	style   = "fade",
})
hyprland.animation({
	leaf    = "zoomFactor",
	enabled = true,
	speed   = 7,
	bezier  = curve.quick,
})
