local wezterm = require 'wezterm'
local act = wezterm.action

local M = {}

M = {
	-- Kanagawa theme.
	force_reverse_video_cursor = true,
	colors = {
		foreground = "#dcd7ba",
		background = "#1f1f28",

		cursor_bg = "#c8c093",
		cursor_fg = "#c8c093",
		cursor_border = "#c8c093",

		selection_fg = "#c8c093",
		selection_bg = "#2d4f67",

		scrollbar_thumb = "#16161d",
		split = "#16161d",

		ansi = { "#090618", "#c34043", "#76946a", "#c0a36e", "#7e9cd8", "#957fb8", "#6a9589", "#c8c093" },
		brights = { "#727169", "#e82424", "#98bb6c", "#e6c384", "#7fb4ca", "#938aa9", "#7aa89f", "#dcd7ba" },
		indexed = { [16] = "#ffa066", [17] = "#ff5d62" },
	},
	-- Other configuration.
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	--window_decorations = "RESIZE", -- No need if using an extension!!
	keys = {
		{
			key = 'F11',
			action = act.ToggleFullScreen 
		},
		{
			key = '+',
			mods = 'CTRL',
			action = act.IncreaseFontSize 
		},
		{
			key = '-',
			mods = 'CTRL',
			action = act.DecreaseFontSize 
		},
		{
			key = 'h',
			mods = 'CTRL|SHIFT|ALT',
			action = act.SplitHorizontal
		},
		{
			key = 'v',
			mods = 'CTRL|SHIFT|ALT',
			action = act.SplitVertical 
		},
		{
			key = 'h',
			mods = 'CTRL|SHIFT',
			action = act.ActivatePaneDirection 'Left',
		},
		{
			key = 'l',
			mods = 'CTRL|SHIFT',
			action = act.ActivatePaneDirection 'Right',
		},
		{
			key = 'k',
			mods = 'CTRL|SHIFT',
			action = act.ActivatePaneDirection 'Up',
		},
		{
			key = 'j',
			mods = 'CTRL|SHIFT',
			action = act.ActivatePaneDirection 'Down',
		},
	},
	font_size = 14.0,
	font = wezterm.font('Hack Nerd Font'),
	window_padding = {
		left = 10,
		right = 10,
		top = 10,
		bottom = 10
	}
}

if (wezterm.os == "windows") then
	M.font = wezterm.font('Hack NFM')
	M.default_prog = { 'powershell' }
end

return M
