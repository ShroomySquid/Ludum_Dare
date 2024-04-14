extends LineEdit



func _on_text_submitted(new_text):
	if len(text) > 0:
		get_tree().change_scene_to_file("res://node_2d.tscn")
