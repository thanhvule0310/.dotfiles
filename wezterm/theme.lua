local wezterm = require("wezterm")

local Theme = {}

Theme.colors = {
	rosewater = "#e67e80",
	flamingo = "#e67e80",
	red = "#e67e80",
	maroon = "#e67e80",
	pink = "#d699b6",
	mauve = "#d699b6",
	peach = "#e69875",
	yellow = "#dbbc7f",
	green = "#a7c080",
	teal = "#83c092",
	sky = "#83c092",
	sapphire = "#83c092",
	blue = "#7fbbb3",
	lavender = "#7fbbb3",
	text = "#d3c6aa",
	subtext1 = "#B3A891",
	subtext0 = "#9E9580",
	overlay2 = "#7F7766",
	overlay1 = "#544F44",
	overlay0 = "#5d6970",
	surface2 = "#4a545a",
	surface1 = "#384044",
	surface0 = "#262c30",
	base = "#1e2326",
	mantle = "#1B2022",
	crust = "#121517",
}

function Theme.setup(config)
	local colors = Theme.colors

	config.colors = {
		split = colors.surface0,
		foreground = colors.text,
		background = colors.base,
		cursor_bg = colors.subtext0,
		cursor_border = colors.overlay2,
		cursor_fg = colors.base,
		selection_bg = colors.surface2,
		visual_bell = colors.surface0,
		indexed = {
			[16] = colors.peach,
			[17] = colors.rosewater,
		},
		scrollbar_thumb = colors.surface2,
		compose_cursor = colors.flamingo,
		ansi = {
			colors.surface0,
			colors.red,
			colors.green,
			colors.yellow,
			colors.blue,
			colors.mauve,
			colors.teal,
			colors.text,
		},
		brights = {
			colors.surface2,
			colors.red,
			colors.green,
			colors.yellow,
			colors.blue,
			colors.mauve,
			colors.teal,
			colors.surface2,
		},
		tab_bar = {
			background = colors.mantle,
			active_tab = {
				bg_color = "none",
				fg_color = colors.subtext1,
				intensity = "Bold",
				underline = "None",
				italic = false,
				strikethrough = false,
			},
			inactive_tab = {
				bg_color = colors.mantle,
				fg_color = colors.surface2,
			},
			inactive_tab_hover = {
				bg_color = colors.base,
				fg_color = colors.subtext0,
			},
			new_tab = {
				bg_color = colors.base,
				fg_color = colors.subtext0,
			},
			new_tab_hover = {
				bg_color = colors.base,
				fg_color = colors.surface2,
			},
		},
	}
end

return Theme
