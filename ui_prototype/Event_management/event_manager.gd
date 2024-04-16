extends Control

@onready var popups = [$"../event_pop_up", $"../event_pop_up2", $"../event_pop_up3", $"../event_pop_up4", $"../event_pop_up5"]
var ongoing_event = [Event_container.new(), Event_container.new(), Event_container.new(), Event_container.new(), Event_container.new()]

var event_chance = 100
var t = 0

#var event_0: Event_container = Event_container.new(0, [Resource_container.new([-5, -100, 0, 0, 0, 0]), Resource_container.new([0, -300, 0, 0, 0, 0]), Resource_container.new([-2, -10, 0, 0, 0, 0])])
#var event_1: Event_container = Event_container.new(1, [Resource_container.new([-5, -100, 0, 0, 0, 0]), Resource_container.new([0, -300, 0, 0, 0, 0]), Resource_container.new([-2, -10, 0, 0, 0, 0])])
#var event_2: Event_container = Event_container.new(2, [Resource_container.new([-5, -100, 0, 0, 0, 0]), Resource_container.new([0, -300, 0, 0, 0, 0]), Resource_container.new([-2, -10, 0, 0, 0, 0])])

#var event_pool = [event_0, event_1, event_2]
var event_pool = []

# Called when the node enters the scene tree for the first time.
func _ready():
	generate_pool()
	#event_0.set_event_text("This is event_0")
	#event_1.set_event_text("This is event_1")
	#event_2.set_event_text("This is event_2")
	for i in range(5):
		popups[i].hide()
		print(str(i))
	pass


func generate_pool():
	for i in range(10):
		event_pool.append(Event_container.new(i, [Resource_container.new([-5, -100, 0, 0, 0, 0]), Resource_container.new([0, -300, 0, 0, 0, 0]), Resource_container.new([0, 0, 0, 0, 0, 0])]))
		event_pool[i].set_event_text("This is event_" + str(i))
		event_pool[i].reward = Resource_container.new([10, 1000, 0, 0, 0, 0])
		event_pool[i].r_1 = Resource_container.new([10, 1000, 0, 0, 0, 0])
		event_pool[i].r_2 = Resource_container.new([10, 1000, 0, 0, 0, 0])
		event_pool[i].t_1 = 5
		event_pool[i].t_2 = 5
		event_pool[i].t_3 = 0
		print(JSON.stringify(event_pool[i].my_dict()))
	var s = JSON.stringify(Event_container.new(0, [Resource_container.new([0, 0, 0, 0, 0, 0]), Resource_container.new([0, 0, 0, 0, 0, 0]), Resource_container.new([0, 0, 0, 0, 0, 0])]).my_dict())
	var json = JSON.new()
	json.parse(s)
	event_pool[0] = Event_container.from_dict(json.data)
	print(JSON.stringify(event_pool[0].my_dict()))
	print("Pool refreshed")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	t += delta
	for i in range(5):
		if ongoing_event[i].is_placeholder:
			continue
		if ongoing_event[i].is_active:
			ongoing_event[i].timer -= delta
		if ongoing_event[i].timer <= 0:
			if Resource_container.compare($"../UI".resources, ongoing_event[i].reward):
				$"../UI".resources = Resource_container.combine($"../UI".resources, ongoing_event[i].reward)
				print("event " + str(i) + " resolved (" + ongoing_event[i].event_text + ")")
			else:
				print("event " + str(i) + " failed (" + ongoing_event[i].event_text + ")")
			get_parent().get_node("Conclusion_window").add_event(ongoing_event[i])
			ongoing_event[i] = Event_container.new()
	if t > 1:
		t -= 1
		var guy = randi_range(0, 4)
		if !ongoing_event[guy].is_placeholder:
			return
		if randi_range(1, 100) < event_chance:
			if event_pool.is_empty():
				generate_pool()
			var e = randi_range(0, event_pool.size() - 1)
			event_pool[e].exclusive = guy
			popups[guy].load_event(event_pool[e])
			ongoing_event[guy] = event_pool[e]
			event_pool.pop_at(e)
			popups[guy].show()
			t = 0
 


func _on_event_window_1_event_window_done():
	pass
