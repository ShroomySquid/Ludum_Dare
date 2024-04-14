class_name Event_container
extends Node

#maybe not
var event_text = "placeholder et je suis une banane"

var cost_1: Resource_container
var cost_2: Resource_container
var cost_3: Resource_container
var is_active = false
var is_placeholder = true
var fail: Resource_container:
	set(value):
		fail = value
var reward: Resource_container
var event_id: int:
	get:
		return event_id
var modifier: int:
	get:
		return modifier
	set(value):
		modifier = value
var timer:
	get:
		return timer
var efficiency: int:
	get:
		return efficiency

func set_event_text(s: String):
	event_text = s

func set_reward(r: Resource_container):
	reward = r

func _init(id:int=-1, r = [Resource_container.new(), Resource_container.new(), Resource_container.new()], m:int=1, t=5, e:int=100):
	event_id = id
	if id > 0:
		is_placeholder = false
	#fetch event text
	cost_1 = r[0]
	cost_2 = r[1]
	cost_3 = r[2]
	fail = Resource_container.new()
	reward = Resource_container.new()
	modifier = m
	timer = t
	efficiency = e

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if is_active:
		#timer -= delta
	pass
