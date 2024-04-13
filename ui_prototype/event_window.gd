extends Window
signal alex

# Called when the node enters the scene tree for the first time.
func _ready():
	#self.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_event_first_button_pressed():
	print("test")
	self.hide()
	alex.emit()
	pass # Replace with function body.

