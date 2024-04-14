extends Button


func _on_pressed():
	var settings_scene = $".."
	var title_screen_scene = $"../../TitleScreen"
	var name_page_scene = $"../../name_page"
	
	settings_scene.hide()
	title_screen_scene.show()
	name_page_scene.hide()
