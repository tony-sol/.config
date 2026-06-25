---@diagnostic disable-next-line:undefined-global
local hyprland = hl

hyprland.config({
	animations = {
		enabled = true,
	}
})

hyprland.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hyprland.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hyprland.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hyprland.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hyprland.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
hyprland.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hyprland.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hyprland.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hyprland.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
hyprland.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
hyprland.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hyprland.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hyprland.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hyprland.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hyprland.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hyprland.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hyprland.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hyprland.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hyprland.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hyprland.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hyprland.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hyprland.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hyprland.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

-- animations {
--     enabled = yes, please :)

--     bezier = easeOutQuint, 0.23, 1, 0.32, 1
--     bezier = easeInOutCubic, 0.65, 0.05, 0.36, 1
--     bezier = linear, 0, 0, 1, 1
--     bezier = almostLinear, 0.5, 0.5, 0.75, 1.0
--     bezier = quick, 0.15, 0, 0.1, 1

--     animation = global, 1, 10, default
--     animation = border, 1, 5.39, easeOutQuint
--     animation = windows, 1, 4.79, easeOutQuint
--     animation = windowsIn, 1, 4.1, easeOutQuint, popin 87%
--     animation = windowsOut, 1, 1.49, linear, popin 87%
--     animation = fadeIn, 1, 1.73, almostLinear
--     animation = fadeOut, 1, 1.46, almostLinear
--     animation = fade, 1, 3.03, quick
--     animation = layers, 1, 3.81, easeOutQuint
--     animation = layersIn, 1, 4, easeOutQuint, fade
--     animation = layersOut, 1, 1.5, linear, fade
--     animation = fadeLayersIn, 1, 1.79, almostLinear
--     animation = fadeLayersOut, 1, 1.39, almostLinear
--     animation = workspaces, 1, 1.94, almostLinear, fade
--     animation = workspacesIn, 1, 1.21, almostLinear, fade
--     animation = workspacesOut, 1, 1.94, almostLinear, fade
-- }
