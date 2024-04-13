extends Control
var cultist_count = 0
var magic_count = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$cultist_label.text = "Cultists: " + str(cultist_count)
	$magic_label.text = "Magic: " + str(cultist_count)
