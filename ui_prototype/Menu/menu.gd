extends Control

@onready var main = $"../../UI"

func _ready():
	pass

func _process(_delta):
	pass

func _on_resume_pressed():
	main.pauseMenu()

func _on_quit_pressed():
	get_tree().quit()
