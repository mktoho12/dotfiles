local wezterm = require "wezterm"

return {
  -- ページ上スクロール
  {
    key = "UpArrow",
    mods = "CMD",
    action = wezterm.action.ScrollByPage(-1),
  },
  -- ページ下スクロール
  {
    key = "DownArrow",
    mods = "CMD",
    action = wezterm.action.ScrollByPage(1),
  },
}

