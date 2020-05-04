function sendWindowToScreen(d)
  return function()
    local displays = hs.screen.allScreens()
    local window = hs.window.focusedWindow()
    window:moveToScreen(displays[d], false, true)
    hs.alert.show("Screen " .. d)
  end
end

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "1", sendWindowToScreen(1))
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "2", sendWindowToScreen(2))
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "3", sendWindowToScreen(3))
