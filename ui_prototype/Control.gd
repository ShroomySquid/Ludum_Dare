extends Control
var cultist_count = 100
var magic_count = 1000
var loyalty_percent = 100
var prisoners_count = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	magic_count -= delta * cultist_count
	if (int(magic_count) == 0):
		print("Dead you are, try again you must.")
	$cultist_label.text = "Cultists: " + str(cultist_count)
	$magic_label.text = "Magic: " + str(int(magic_count))
	$loyalty_bar.value = loyalty_percent
	$prisoners_label.text = "Prisoners: " + str(prisoners_count)
