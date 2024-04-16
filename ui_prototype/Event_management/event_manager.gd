extends Control

@onready var archons_audio = $"../../archons_sounds"
@onready var popups = [$"../event_pop_up", $"../event_pop_up2", $"../event_pop_up3", $"../event_pop_up4", $"../event_pop_up5"]
var ongoing_event = [Event_container.new(), Event_container.new(), Event_container.new(), Event_container.new(), Event_container.new()]
var cost_modifier = Resource_container.new([100, 100, 100, 100, 100, 100])
var ritual_master_events = []


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
	var file = FileAccess.open("res://jsons/ritual_master.json", FileAccess.READ)
	var s = file.get_as_text()
	var json = JSON.new()
	json.parse(s)
	var holder = json.data
	for i in holder:
		ritual_master_events.append(Event_container.from_dict(i))
		print("success")
	for i in range(5):
		popups[i].hide()
		print(str(i))
	pass


func apply_cost_modifier(e: Event_container):
	e.cost_1.scale(cost_modifier)
	e.cost_2.scale(cost_modifier)
	e.cost_3.scale(cost_modifier)

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
		if ongoing_event[i].timer <= 0 && ongoing_event[i].is_active:
			if Resource_container.compare($"../UI".resources, ongoing_event[i].reward):
				$"../UI".resources = Resource_container.combine($"../UI".resources, ongoing_event[i].reward)
				print("event " + str(i) + " resolved (" + ongoing_event[i].event_text + ")")
			else:
				print("event " + str(i) + " failed (" + ongoing_event[i].event_text + ")")
			print("I'm a dumbass")
			$"../Conclusion_window".add_event(ongoing_event[i])
			if ongoing_event[i].exclusive == 0 && ongoing_event[i].event_id == 3 && ongoing_event[i].choice == 2:
				cost_modifier.set_re(Resources.r.MAGIC, 75)
			elif ongoing_event[i].exclusive == 0 && ongoing_event[i].event_id == 3 && ongoing_event[i].choice == 3:
				$"../UI".magic_modifier = 2
			elif ongoing_event[i].exclusive == 0 && ongoing_event[i].event_id == 5 && ongoing_event[i].choice == 1:
				$"../UI".living_costs *= 0.5
			elif ongoing_event[i].exclusive == 0 && ongoing_event[i].event_id == 5 && ongoing_event[i].choice == 2:
				$"../UI".static_resources.add_re(Resources.r.MAGIC, 1)
			elif ongoing_event[i].exclusive == 0 && ongoing_event[i].event_id == 5 && ongoing_event[i].choice == 3:
				$"../UI".daily_income = Resource_container.combine($"../UI".daily_income, Resource_container.new([0, 0, 5, 0, 0, 0]))
			elif ongoing_event[i].exclusive == 3 && ongoing_event[i].event_id == 4 && ongoing_event[i].choice == 1:
				$"../UI".insurance_flag = true
			elif ongoing_event[i].exclusive == 1 && ongoing_event[i].event_id == 3 && ongoing_event[i].choice == 2:
				$"../UI".static_resources.add_re(Resources.r.CULTISTS, 2/10)
				$"../UI".static_resources.add_re(Resources.r.GOLD, 1000/10)
				$"../UI".static_resources.add_re(Resources.r.MAGIC, 500/10)
			elif ongoing_event[i].exclusive == 2 && ongoing_event[i].event_id == 6 && ongoing_event[i].choice == 1:
				$"../UI".gill_bates_flag = true
			elif ongoing_event[i].exclusive == 2 && ongoing_event[i].event_id == 6 && ongoing_event[i].choice == 2:
				$"../UI".targaret_matcher_flag = true
			ongoing_event[i] = Event_container.new()
	if t > 1:
		t -= 1
		var guy = randi_range(0, 4)
		if !ongoing_event[guy].is_placeholder:
			return
		if guy == 0 && ritual_master_events.size() != 0:
			var e = randi_range(1, ritual_master_events.size() - 1)
			popups[0].load_event(ritual_master_events[e])
			ongoing_event[0] = ritual_master_events[e]
			ritual_master_events.pop_at(e)
			popups[0].show()
			t = 0
		elif randi_range(1, 100) < event_chance:
			if event_pool.is_empty():
				generate_pool()
			var e = randi_range(0, event_pool.size() - 1)
			event_pool[e].exclusive = guy
			popups[guy].load_event(event_pool[e])
			ongoing_event[guy] = event_pool[e]
			event_pool.pop_at(e)
			popups[guy].show()
			archons_audio.play_sound(guy)
			t = 0
 


func _on_event_window_1_event_window_done():
	pass
