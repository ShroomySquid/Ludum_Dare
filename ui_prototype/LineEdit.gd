extends LineEdit

signal game_start

func _on_text_submitted(new_text):
	var name_window = $".."
	if len(text) > 0:
		game_start.emit()
		name_window.hide()
