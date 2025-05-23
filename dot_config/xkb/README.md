##### Keyboard layout (XKB)
For wayland extract the "alt-nord-linux-hyprland.zip" to $HOME/.config/xkb/
And add this to the input section `kb_layout = alt-nord,us`
Then restart or log out it should be available

Folder tree should look like this
```
$HOME/.config/xkb/
├── compat
├── keycodes
├── rules
│   └── evdev.xml
├── symbols
│   └── us
└── types
```

**Links**
- https://who-t.blogspot.com/2020/09/user-specific-xkb-configuration-putting.html
- https://github.com/xkbcommon/libxkbcommon/blob/master/doc/user-configuration.md
