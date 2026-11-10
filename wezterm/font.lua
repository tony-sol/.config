local wezterm = require('wezterm')

return wezterm.font_with_fallback {
	{ family = 'JetBrains Mono',         assume_emoji_presentation = false },
	{ family = 'Symbols Nerd Font Mono', assume_emoji_presentation = true },
}
