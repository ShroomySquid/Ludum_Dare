extends Window
signal event_window_done

@onready var UI = $"../UI"
var loaded_event: Event_container = Event_container.new()
var active = false

# Called when the node enters the scene tree for the first time.
func _ready():
	#self.add_theme_icon_override("close", Texture2D.new())
	self.hide()
	#gui_embed_subwindows = true
	pass # Replace with function body.

func get_player_res():
	return UI.available_cultists

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_event_b1():
	print("b1")
	UI.resources = Resource_container.combine(UI.resources, loaded_event.cost_1)
	loaded_event.reward = loaded_event.r_1
	loaded_event.timer = loaded_event.t_1
	loaded_event.t_chosen = loaded_event.t_1
	loaded_event.choice = 1
	loaded_event.is_active = true
	self.hide()
	active = false
	emit_signal("event_window_done")
	pass # Replace with function body.


func _on_event_b2():
	print("b2")
	UI.resources = Resource_container.combine(UI.resources, loaded_event.cost_2)
	loaded_event.reward = loaded_event.r_2
	loaded_event.timer = loaded_event.t_2
	loaded_event.t_chosen = loaded_event.t_2
	loaded_event.choice = 2
	loaded_event.is_active = true
	self.hide()
	active = false
	emit_signal("event_window_done")
	pass # Replace with function body.


func _on_event_b3():
	print("b3")
	UI.resources = Resource_container.combine(UI.resources, loaded_event.cost_3)
	loaded_event.reward = loaded_event.r_3
	loaded_event.timer = loaded_event.t_3
	loaded_event.t_chosen = loaded_event.t_3
	loaded_event.choice = 3
	loaded_event.is_active = true
	self.hide()
	active = false
	emit_signal("event_window_done")
	pass # Replace with function body.

func load_event(e:Event_container):
	loaded_event = e
	#if loaded_event.exclusive == 0
		#
	pass
	

func _on_event_pop_up_bubble_signal():
	$lieutenant1.hide()
	$lieutenant2.hide()
	$lieutenant3.hide()
	$lieutenant4.hide()
	$lieutenant5.hide()
	if (loaded_event.exclusive == 0):
		$lieutenant1.show()
	elif (loaded_event.exclusive == 1):
		$lieutenant2.show()
	elif (loaded_event.exclusive == 2):
		$lieutenant3.show()
	elif (loaded_event.exclusive == 3):
		$lieutenant4.show()
	elif (loaded_event.exclusive == 4):
		$lieutenant5.show()
	else:
		$lieutenant1.show()
	$event_text.text = loaded_event.event_text
	$event_button1.load_cost(loaded_event.cost_1)
	$event_button2.load_cost(loaded_event.cost_2)
	$event_button3.load_cost(loaded_event.cost_3)
	active = true
	self.show()
	pass # Replace with function body.


func _on_close_requested():
	$"../Event_manager".popups[loaded_event.exclusive].load_event(loaded_event)
	$"../Event_manager".popups[loaded_event.exclusive].show()
	active = false
	self.hide()
	pass # Replace with function body.
