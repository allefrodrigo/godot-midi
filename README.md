# MIDI Event Driven Animation in Godot

![Banner](path_to_your_banner.gif)

## Overview

This project demonstrates a simple Godot script that listens for MIDI events and triggers animations based on the received events. The script uses the MIDIPlayer node to handle MIDI events and a Tween node to animate an icon's position.

## Features

- Listens for MIDI 'Note On' events.
- Animates the position of an icon based on the received MIDI events.

## Code

```gdscript
extends Node2D

var action = 0

func _ready():
    # Connect the midi_event signal to the method using Callable
    $MIDIPlayer.connect("midi_event", Callable(self, "_on_midi_player_midi_event"))

func _on_midi_player_midi_event(channel, event):
    if event.type == 144:  # Note on event
        print("Note on event received: ", event.note)
        if action == 0:
            var tween = create_tween()
            tween.tween_property($Icon, "global_position", Vector2(600, 323), 0.2)
            action = 1
        elif action == 1:
            var tween = create_tween()
            tween.tween_property($Icon, "global_position", Vector2(217, 323), 0.2)
            action = 0
```
## How to Use

1. Add a MIDIPlayer node to your scene.
2. Add an Icon (or any other Node2D) that you want to animate.
3. Attach the script to a Node2D (such as the root node of your scene).
4. Ensure your MIDI device is connected and configured in Godot.
5. Run the scene and play some MIDI notes to see the icon animate.

## Requirements

- Godot Engine 3.x or later.
- A MIDI input device.


