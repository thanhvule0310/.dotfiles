local wezterm = require("wezterm")

local Fonts = {}

function Fonts.setup(config)
	config.font = wezterm.font_with_fallback({
		"AdwaitaMono Nerd Font",
		-- "Apple Color Emoji",
	})

	config.font_size = 12
	config.underline_thickness = "200%"
	config.underline_position = "-3pt"
	config.line_height = 1.3
end

return Fonts
