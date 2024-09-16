local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'Tokyo Night'
config.font_size = 13
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.hide_tab_bar_if_only_one_tab = true

config.window_frame = {
  active_titlebar_bg = '#1a1b26',
  font = wezterm.font { family = 'Jetbrains Mono' },
  font_size = 13.0,
}

config.window_padding = {
  top = 50,
}

config.colors = {
  tab_bar = {
    active_tab = {
      bg_color = '#7aa2f7',
      fg_color = '#16161e',
    },
    inactive_tab = {
      bg_color = '#292e42',
      fg_color = '#545c7e',
    },
    inactive_tab_hover = {
      bg_color = '#292e42',
      fg_color = '#7aa2f7',
    },
    new_tab = {
      bg_color = '#1a1b26',
      fg_color = '#7aa2f7',
    },
    new_tab_hover = {
      bg_color = '#1a1b26',
      fg_color = '#7aa2f7',
    },
  },
}
return config