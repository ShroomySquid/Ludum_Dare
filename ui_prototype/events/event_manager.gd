extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Timer.wait_time = 30 #time to wait for player to do the event
	$Timer.start()
	pass
