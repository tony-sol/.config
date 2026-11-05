---@diagnostic disable:undefined-global
local curve     = hl.curve
local animation = hl.animation
---@diagnostic enable:undefined-global

local curves    = {
	default        = 'default',
	easeOutQuint   = 'easeOutQuint',
	easeInOutCubic = 'easeInOutCubic',
	linear         = 'linear',
	almostLinear   = 'almostLinear',
	quick          = 'quick',
	easy           = 'easy',
}

curve(curves.easeOutQuint, { type = 'bezier', points = { { 0.23, 1 }, { 0.32, 1 } } })
curve(curves.easeInOutCubic, { type = 'bezier', points = { { 0.65, 0.05 }, { 0.36, 1 } } })
curve(curves.linear, { type = 'bezier', points = { { 0, 0 }, { 1, 1 } }, })
curve(curves.almostLinear, { type = 'bezier', points = { { 0.5, 0.5 }, { 0.75, 1 } } })
curve(curves.quick, { type = 'bezier', points = { { 0.15, 0 }, { 0.1, 1 } } })
curve(curves.easy, { type = 'spring', mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

animation({ leaf = 'global', enabled = true, speed = 10, bezier = curves.default })
animation({ leaf = 'border', enabled = true, speed = 5.39, bezier = curves.easeOutQuint })
animation({ leaf = 'windows', enabled = true, speed = 4.79, spring = curves.easy })
animation({ leaf = 'windowsIn', enabled = true, speed = 4.1, spring = curves.easy, style = 'popin 87%' })
animation({ leaf = 'windowsOut', enabled = true, speed = 1.49, bezier = curves.linear, style = 'popin 87%' })
animation({ leaf = 'fadeIn', enabled = true, speed = 1.73, bezier = curves.almostLinear })
animation({ leaf = 'fadeOut', enabled = true, speed = 1.46, bezier = curves.almostLinear })
animation({ leaf = 'fade', enabled = true, speed = 3.03, bezier = curves.quick })
animation({ leaf = 'layers', enabled = true, speed = 3.81, bezier = curves.easeOutQuint })
animation({ leaf = 'layersIn', enabled = true, speed = 4, bezier = curves.easeOutQuint, style = 'fade' })
animation({ leaf = 'layersOut', enabled = true, speed = 1.5, bezier = curves.linear, style = 'fade' })
animation({ leaf = 'fadeLayersIn', enabled = true, speed = 1.79, bezier = curves.almostLinear })
animation({ leaf = 'fadeLayersOut', enabled = true, speed = 1.39, bezier = curves.almostLinear })
animation({ leaf = 'workspaces', enabled = true, speed = 1.94, bezier = curves.almostLinear, style = 'fade' })
animation({ leaf = 'workspacesIn', enabled = true, speed = 1.21, bezier = curves.almostLinear, style = 'fade' })
animation({ leaf = 'workspacesOut', enabled = true, speed = 1.94, bezier = curves.almostLinear, style = 'fade' })
animation({ leaf = 'zoomFactor', enabled = true, speed = 7, bezier = curves.quick })
