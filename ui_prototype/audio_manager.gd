extends AudioStreamPlayer

var intro_music_is_stoped = false
# Called when the node enters the scene tree for the first time.
func _ready():
	self.play() 

func _process(delta):
	if !self.playing and !intro_music_is_stoped:
		self.play()

func _on_master_slider_value_changed(value):
		AudioServer.set_bus_volume_db(0, value) #Replace with function body.


func _on_line_edit_game_start():
	intro_music_is_stoped = true
	self.stop()


func _on_music_slider_value_changed(value):
	self.volume_db = value
