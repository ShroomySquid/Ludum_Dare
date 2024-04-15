extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	self.play() 


func _process(delta):
	if !self.playing:
		self.play()


func _on_master_slider_value_changed(value):
	print(value)
	AudioServer.set_bus_volume_db(0, value) #Replace with function body.
