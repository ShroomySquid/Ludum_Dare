extends Window
signal event_window_done

@onready var UI = $"../UI"
var loaded_event: Event_container

# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()
	pass # Replace with function body.

func get_player_res():
	return UI.available_cultists

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_event_b1():
	print("b1")
	self.hide()
	emit_signal("event_window_done")
	pass # Replace with function body.


func _on_event_b2():
	print("b2")
	self.hide()
	emit_signal("event_window_done")
	pass # Replace with function body.


func _on_event_b3():
	print("b3")
	self.hide()
	emit_signal("event_window_done")
	pass # Replace with function body.



func _on_event_pop_up_bubble_signal():
	loaded_event = Event_container.new()
	$event_text.text = loaded_event.event_text
	self.show()
	pass # Replace with function body.
