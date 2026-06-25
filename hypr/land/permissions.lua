---@diagnostic disable-next-line:undefined-global
local hyprland = hl

hyprland.config({
  ecosystem = {
    enforce_permissions = true,
  },
})

hyprland.permission("/usr/lib(|exec|64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
hyprland.permission("/usr/(|local/)bin/hyprlock", "screencopy", "allow")
hyprland.permission("/usr/(|local/)bin/hyprshot", "screencopy", "allow")
hyprland.permission("/usr/(|local/)bin/grim", "screencopy", "allow")
hyprland.permission("usr/(|local/)bin/hyprpm", "plugin", "allow")
