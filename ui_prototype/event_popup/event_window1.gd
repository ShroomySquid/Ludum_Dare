extends Window
signal event_window_done

@onready var UI = $"../UI"
var loaded_event: Event_container = Event_container.new()
var active = false

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
	UI.resources = Resource_container.combine(UI.resources, loaded_event.cost_1)
	loaded_event.is_active = true
	self.hide()
	active = false
	emit_signal("event_window_done")
	pass # Replace with function body.


func _on_event_b2():
	print("b2")
	UI.resources = Resource_container.combine(UI.resources, loaded_event.cost_2)
	loaded_event.is_active = true
	self.hide()
	active = false
	emit_signal("event_window_done")
	pass # Replace with function body.


func _on_event_b3():
	print("b3")
	UI.resources = Resource_container.combine(UI.resources, loaded_event.cost_3)
	loaded_event.is_active = true
	self.hide()
	active = false
	emit_signal("event_window_done")
	pass # Replace with function body.

func load_event(e:Event_container):
	loaded_event = e

func _on_event_pop_up_bubble_signal():
	$event_text.text = loaded_event.event_text
	$event_button1.load_cost(loaded_event.cost_1)
	$event_button2.load_cost(loaded_event.cost_2)
	$event_button3.load_cost(loaded_event.cost_3)
	active = true
	self.show()
	pass # Replace with function body.
