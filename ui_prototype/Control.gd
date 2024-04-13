extends Control
var cultist_count = 100
var magic_count = 1000
var loyalty_count = 0
var prisoners_count = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$cultist_label.text = "Cultists: " + str(cultist_count)
	$magic_label.text = "Magic: " + str(magic_count)
	$loyalty_bar.value = loyalty_count
	$prisoners_label.text = "Prisoners: " + str(prisoners_count)
