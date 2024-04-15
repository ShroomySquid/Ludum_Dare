extends AudioStreamPlayer

var music_is_stoped = true
# Called when the node enters the scene tree for the first time.
 
func _process(delta):
	if !self.playing and !music_is_stoped:
		self.play()

func _on_line_edit_game_start():
	music_is_stoped = false
	self.play()
