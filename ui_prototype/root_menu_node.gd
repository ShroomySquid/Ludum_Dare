extends Control

var god_name

func _on_line_edit_game_start():
	var line_edit = $name_page/LineEdit
	god_name = line_edit.text
