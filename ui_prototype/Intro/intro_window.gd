extends Window


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)
	#connect("input_event", self, "_input")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_s_key_pressed():
	self.hide()
	pass
	
#func _input(event):
	#if event is InputEventKey and event.pressed:
		#if event.keycode == KEY_S:
			#print("S was pressed")
			#self.hide()
	
	

func _on_button_pressed():
	self.hide()
	pass # Replace with function body.



func _on_skip_tuto_pressed():
	pass # Replace with function body.
