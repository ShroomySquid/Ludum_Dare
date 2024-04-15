extends AudioStreamPlayer

var sound_array = []
	
func play_sound(index):
	if index >= 0 and index < sound_array.size():
		self.stream = sound_array[index]
		self.play()

func _ready():
	sound_array.append(preload("res://audio/Voix1_1.mp3"))
	sound_array.append(preload("res://audio/Voix2v2_1.mp3"))
	sound_array.append(preload("res://audio/Voix3_4.mp3"))
	sound_array.append(preload("res://audio/Voix4_1.mp3"))
	sound_array.append(preload("res://audio/Voix5_1.mp3"))
	

func _on_sound_slider_value_changed(value):
	self.volume_db = value
