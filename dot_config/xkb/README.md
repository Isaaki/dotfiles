##### Keyboard layout (XKB)
For wayland move "alt-nord" file to to $HOME/.config/xkb/symbols/
And add this to the input section `kb_layout = alt-nord,us`
Then restart or log out it should be available

Folder tree should look like this
```
$HOME/.config/xkb/
├── symbols
│   └── alt-nord
```

**Links**
- https://who-t.blogspot.com/2020/09/user-specific-xkb-configuration-putting.html
- https://github.com/xkbcommon/libxkbcommon/blob/master/doc/user-configuration.md
