-- Pull in the wezterm API
local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.initial_cols = 180
config.initial_rows = 40

config.color_scheme = "AdventureTime"
-- config.color_scheme = "Kasugano"

config.font_size = 14
-- config.font = wezterm.font("JetBrains Mono")
-- config.font = wezterm.font("ZedMono Nerd Font")
-- config.font = wezterm.font("FiraCode Nerd Font")
-- config.font = wezterm.font("0xProto Nerd Font Mono")
config.font = wezterm.font("VictorMono Nerd Font Propo", { weight = "Bold" })

-- You can specify some parameters to influence the font selection;
-- for example, this selects a Bold, Italic font variant.
-- config.font = wezterm.font("JetBrains Mono", { weight = "Bold", italic = true })

config.window_background_image = "/Users/georgekastrinis/Downloads/wallpapers/duck soup.png"
config.window_background_image = "/Users/georgekastrinis/Downloads/wallpapers/cyberpunk-2077-1.jpeg"
config.window_background_image = "/Users/georgekastrinis/Downloads/wallpapers/cyberpunk-2077-6.png"
config.window_background_image = "/Users/georgekastrinis/Downloads/wallpapers/cyberpunk-2077-4.jpg"
config.window_background_image = "/Users/georgekastrinis/Downloads/wallpapers/cyberpunk-2077-3.jpg"
config.window_background_image = "/Users/georgekastrinis/Downloads/wallpapers/cyberpunk-2077-5.jpg"

config.window_background_image_hsb = {
	-- Darken the background image by reducing it to 1/3rd
	brightness = 0.3,
	-- You can adjust the hue by scaling its value.
	-- a multiplier of 1.0 leaves the value unchanged.
	hue = 1.0,
	-- You can adjust the saturation also.
	saturation = 1.0,
}

-- Finally, return the configuration to wezterm:
return config
