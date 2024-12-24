local wezterm = require("wezterm")

local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

local function font(opts)
	return wezterm.font_with_fallback({
		opts,
		"Symbols Nerd Font Mono",
	})
end

local function is_vim(pane)
	-- this is set by the plugin, and unset on ExitPre in Neovim
	return pane:get_user_vars().IS_NVIM == "true"
end

local direction_keys = {
	Left = "h",
	Down = "j",
	Up = "k",
	Right = "l",
	-- reverse lookup
	h = "Left",
	j = "Down",
	k = "Up",
	l = "Right",
}

local function split_nav(resize_or_move, key)
	return {
		key = key,
		mods = resize_or_move == "resize" and "META" or "CTRL",
		action = wezterm.action_callback(function(win, pane)
			if is_vim(pane) then
				-- pass the keys through to vim/nvim
				win:perform_action({
					SendKey = { key = key, mods = resize_or_move == "resize" and "META" or "CTRL" },
				}, pane)
			else
				if resize_or_move == "resize" then
					win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
				else
					win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
				end
			end
		end),
	}
end

return {
	-- leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 },
	-- keys = {
	-- 	-- splitting
	-- 	{
	-- 		mods = "LEADER",
	-- 		key = "-",
	-- 		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	-- 	},
	-- 	{
	-- 		mods = "LEADER",
	-- 		key = "=",
	-- 		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	-- 	},
	-- 	{
	-- 		mods = "LEADER",
	-- 		key = "z",
	-- 		action = wezterm.action.TogglePaneZoomState,
	-- 	},
	-- 	split_nav("move", "h"),
	-- 	split_nav("move", "j"),
	-- 	split_nav("move", "k"),
	-- 	split_nav("move", "l"),
	-- 	-- resize panes
	-- 	split_nav("resize", "h"),
	-- 	split_nav("resize", "j"),
	-- 	split_nav("resize", "k"),
	-- 	split_nav("resize", "l"),
	-- },
	adjust_window_size_when_changing_font_size = false,
	audible_bell = "Disabled",
	bold_brightens_ansi_colors = true,
	color_scheme = "nordfox",
	color_scheme_dirs = { "~/.config/wezterm/themes" },
	allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace",
	font = font({ family = "JetBrains Mono", weight = "Bold", italic = false }),
	font_size = 16,
	line_height = 1.1,
	hide_tab_bar_if_only_one_tab = true,
	native_macos_fullscreen_mode = true,
	scrollback_lines = 20000,
	show_tab_index_in_tab_bar = false,
	term = "wezterm",
	use_dead_keys = false,
	use_fancy_tab_bar = true,
	send_composed_key_when_left_alt_is_pressed = true,
	send_composed_key_when_right_alt_is_pressed = false,
	window_background_opacity = 1,
	inactive_pane_hsb = {
		saturation = 0.9,
		brightness = 0.9,
	},
	window_frame = {
		-- The font used in the tab bar.
		-- Roboto Bold is the default; this font is bundled
		-- with wezterm.
		-- Whatever font is selected here, it will have the
		-- main font setting appended to it to pick up any
		-- fallback fonts you may have used there.
		font = font({ family = "JetBrains Mono" }),

		-- The size of the font in the tab bar.
		-- Default to 10. on Windows but 12.0 on other systems
		font_size = 16.0,

		-- The overall background color of the tab bar when
		-- the window is focused
		active_titlebar_bg = "#2e3440",

		-- The overall background color of the tab bar when
		-- the window is not focused
		inactive_titlebar_bg = "#1e2030",
	},
	hyperlink_rules = wezterm.default_hyperlink_rules(),
}
