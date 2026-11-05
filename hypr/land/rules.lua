---@diagnostic disable:undefined-global
local layer_rule  = hl.layer_rule
local window_rule = hl.window_rule
---@diagnostic enable:undefined-global

local namespace_noctalia = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$"

layer_rule({ match = { namespace = namespace_noctalia }, no_anim = true })
layer_rule({ match = { namespace = namespace_noctalia }, ignore_alpha = 0.5, blur = true, blur_popups = true })

window_rule({ match = { class = '^(Happ)$' }, float = true })
window_rule({ match = { class = '^(steam)$', title = 'negative:^(Steam)$' }, float = true })
