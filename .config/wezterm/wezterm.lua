-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- サブモジュールを require
local keys = require "keys"

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Dracula'
config.font_size = 18.0
config.hide_tab_bar_if_only_one_tab = true


config.unix_domains = {
  { name = "unix" },
}
config.default_gui_startup_args = { "connect", "unix" }

config.ssh_domains = {
  {
    name = "jt-frontend-dev-server",
    remote_address = "18.179.95.93",
    username = 'ec2-user',
    ssh_option = {
      identityfile = '~/.ssh/irodori-developer.pem'
    },
    multiplexing = "WezTerm",
    default_prog = { "fish" },
    remote_wezterm_path = "/home/ec2-user/wezterm-agent/wezterm",
  },
}

config.keys = keys

wezterm.on("gui-startup", function(cmd)
  local mux = wezterm.mux
  local workspace = "main"

  -- GUI起動時に既存セッションに接続（なければ作成）
  mux.spawn_window({ workspace = workspace })
  wezterm.log_info("Started or attached to workspace: " .. workspace)
end)


-- and finally, return the configuration to wezterm
return config
