extends Node2D

var action = 0

func _ready():
	# Conecte o sinal midi_event ao método usando Callable
	
	$MIDIPlayer.connect("midi_event", Callable(self, "_on_midi_player_midi_event"))
	if $ADSR.has_method("play"):
		$ADSR.play()
		
func _on_midi_player_midi_event(channel, event):
	if event.type == 144:  # Note on event
		print("Note on event received: ", event.note)
		if action == 0:
			var tween = create_tween()
			tween.tween_property($Icon, "global_position", Vector2(600,323),0.2)
			action = 1
		elif action == 1:
			var tween = create_tween()
			tween.tween_property($Icon, "global_position", Vector2(217,323),0.2)

			action = 0
