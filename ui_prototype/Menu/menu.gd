extends Control

@onready var main = $"../UI"

func _ready():
	pass # Replace with function body.

func _process(delta):
	pass

func _on_resume_pressed():
	main.pauseMenu()

func _on_quit_pressed():
	get_tree().quit()
