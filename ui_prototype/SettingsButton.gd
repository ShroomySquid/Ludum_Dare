extends Button

func _on_pressed():
	var settings_scene = $"../../../../../settings"
	var title_screen_scene = $"../../../.."
	var name_page_scene = $"../../../../../name_page"
	
	settings_scene.show()
	title_screen_scene.hide()
	name_page_scene.hide()
