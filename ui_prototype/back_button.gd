extends Button

var menu_mode = true

func _on_pressed():
	var settings_scene = $".."
	var title_screen_scene = $"../../TitleScreen"
	var name_page_scene = $"../../name_page"
	var game_menu_page = $"../../Untitled Cult Game/MenuLayer/Menu"
	
	if menu_mode:
		settings_scene.hide()
		title_screen_scene.show()
		name_page_scene.hide()
	else:
		settings_scene.hide()
		game_menu_page.show()


func _on_settings_button_pressed():
	menu_mode = false
