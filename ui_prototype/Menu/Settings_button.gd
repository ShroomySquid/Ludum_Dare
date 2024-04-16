extends Button


func _on_pressed():
	var settings_scene = $"../../../../../../settings"

	var menu_page = $"../../.."
	
	menu_page.hide()
	settings_scene.show()

