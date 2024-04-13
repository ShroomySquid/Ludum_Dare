extends Control

signal bubble_signal


func _on_texture_button_pressed():
	bubble_signal.emit()
	
