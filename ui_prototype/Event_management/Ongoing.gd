class_name Event_container
extends Node

#maybe not
var event_text = "placeholder et je suis une banane"

var cost_1: Resource_container
var cost_2: Resource_container
var cost_3: Resource_container
var r_1: Resource_container
var r_2:Resource_container
var r_3:Resource_container
var conclusion_1: String = "placeholder conclusion 1"
var conclusion_2: String = "placeholder conclusion 2"
var conclusion_3: String = "placeholder conclusion 3"
var exclusive = -1
var t_1
var t_2
var t_3
var t_chosen = 0
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

func my_dict():
	var s = {"id":event_id, "exclusive":exclusive, "event_text":event_text, "conclusion_1":conclusion_1, "conclusion_2":conclusion_2, "conclusion_3":conclusion_3, "cost_1":cost_1.basket, "cost_2":cost_2.basket, "cost_3":cost_3.basket, "r_1":r_1.basket, "r_2":r_2.basket, "r_3":r_3.basket, "t_1":t_1, "t_2":t_2, "t_3":t_3}
	return s

static func from_dict(d:Dictionary):
	var e = Event_container.new(d.get("id"), [Resource_container.new(d.get("cost_1")), Resource_container.new(d.get("cost_2")), Resource_container.new(d.get("cost_3"))], 1, d.get("timer"))
	e.set_event_text(d.get("event_text"))
	e.r_1.basket = d.get("r_1")
	e.r_2.basket = d.get("r_2")
	e.r_3.basket = d.get("r_3")
	e.conclusion_1 = d.get("conclusion_1")
	e.conclusion_2 = d.get("conclusion_2")
	e.conclusion_3 = d.get("conclusion_3")
	e.t_1 = d.get("t_1")
	e.t_2 = d.get("t_2")
	e.t_3 = d.get("t_3")
	e.exclusive = d.get("exclusive")
	return e

func _init(id:int=-1, r = [Resource_container.new(), Resource_container.new(), Resource_container.new()], m:int=1, t=5, e:int=100):
	event_id = id
	if id > 0:
		is_placeholder = false
	#fetch event text
	cost_1 = r[0]
	cost_2 = r[1]
	cost_3 = r[2]
	r_1 = Resource_container.new()
	r_2 = Resource_container.new()
	r_3 = Resource_container.new()
	fail = Resource_container.new()
	reward = Resource_container.new()
	t_1 = 0
	t_2 = 0
	t_3 = 0
	modifier = m
	timer = t
	efficiency = e

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if is_active:
		#timer -= delta
	pass
