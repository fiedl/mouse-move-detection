# mouse-move-detection
This helps me to move windows with Cmd+Option

## Usage

```
~/code/mouse-move-detection/mouse.sh
```

## How does it work

1. Mouse movement is monitored with this script and reported to karabiner-elements
2. Karabiner, monitors <kbd>Cmd</kbd>+<kbd>Option</kbd> if the mouse is moving: If held down, it simulates a system hotkey
3. The system hotkey <kbd>Cmd</kbd>+<kbd>Ctrl</kbd>+<kbd>Click</kbd> starts window movement

## Installation

```shell
brew install cliclick

# Activate the system shortcut for step 2
defaults write -g NSWindowShouldDragOnGesture -bool true

git clone git@github.com:fiedl/mouse-move-detection.git
```

In Karabiner Elements add the following modifications:

```json
{
    "description": "Map Cmd+Alt to Cmd+Ctrl+Left Mouse Button (Any Order) only when the mouse is moving",
    "manipulators": [
        {
            "conditions": [
                {
                    "name": "mouse_moving",
                    "type": "variable_if",
                    "value": 1
                }
            ],
            "from": {
                "key_code": "left_gui",
                "modifiers": {
                    "mandatory": ["left_option"],
                    "optional": ["any"]
                }
            },
            "to": [
                {
                    "modifiers": ["left_gui", "left_control"],
                    "pointing_button": "button1"
                }
            ],
            "type": "basic"
        },
        {
            "conditions": [
                {
                    "name": "mouse_moving",
                    "type": "variable_if",
                    "value": 1
                }
            ],
            "from": {
                "key_code": "left_option",
                "modifiers": {
                    "mandatory": ["left_gui"],
                    "optional": ["any"]
                }
            },
            "to": [
                {
                    "modifiers": ["left_gui", "left_control"],
                    "pointing_button": "button1"
                }
            ],
            "type": "basic"
        }
    ]
},
```

## License

MIT
