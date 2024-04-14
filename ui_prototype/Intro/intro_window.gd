extends Window


# Called when the node enters the scene tree for the first time.
func _ready():
	self.add_theme_icon_override("close", Texture2D.new())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_s_key_pressed():
	self.hide()
	pass



func _on_button_pressed():
	get_parent().get_node("UI").is_paused = false
	get_parent().get_node("UI").in_intro = false
	self.hide()
