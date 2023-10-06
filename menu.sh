gdbus call --session --dest org.gnome.Shell \
	--object-path /org/gnome/shell/extensions/flypie \
	--method org.gnome.Shell.Extensions.flypie.ShowCustomMenu \
	'{                                                        \
    "icon": "",                                           \
    "children": [                                           \
      {                                                     \
        "name": "Chrome",                                   \
        "icon": "google-chrome",                            \
        "type": "Command",                                  \
        "data": {                                           \
          "command": "google-chrome"                        \
        }                                                   \
      },                                                    \
      {                                                     \
        "name": "Term",                                     \
        "icon": "terminator",                               \
        "type": "Command",                                  \
        "data": {                                           \
          "command": "terminator --working-directory=/home/kuttelr/work" \
        }                                                   \
      },                                                    \
      {                                                     \
        "name": "Files",                                    \
        "icon": "nautilus",                                 \
        "type": "Command",                                  \
        "data": {                                           \
          "command": "nautilus /home/kuttelr/work"           \
        }                                                   \
      }                                                     \
    ]                                                       \
  }'
