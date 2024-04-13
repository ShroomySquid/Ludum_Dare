class_name event_container
extends Node

#maybe not
var event_text = "placeholder"
var event_id: int:
	get:
		return event_id
var resources: Resource_container:
	get:
		return resources
var modifier: int:
	get:
		return modifier
	set(value):
		modifier = value
var timer: int:
	get:
		return timer
var efficiency: int:
	get:
		return efficiency

func _init(id:int=0, r:Resource_container=Resource_container.new(), m:int=1, t:int=60, e:int=100):
	event_id = id
	#fetch event text
	resources = r
	modifier = m
	timer = t
	efficiency = e

func resolve():
	return resources.scale(efficiency * modifier)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
