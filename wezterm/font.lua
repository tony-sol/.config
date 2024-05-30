local wezterm = require('wezterm')

return wezterm.font_with_fallback {
	{
		family                    = 'JetBrainsMono Nerd Font',
		weight                    = 'Medium',
		harfbuzz_features         = { 'calt=1', 'clig=1', 'liga=1' },
		assume_emoji_presentation = false,
	},
	{
		family                    = 'Menlo',
		weight                    = 'Medium',
		harfbuzz_features         = { 'calt=1', 'clig=1', 'liga=1' },
		assume_emoji_presentation = true,
	},
}
