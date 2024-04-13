extends Control
var available_cultists = 10
var total_cultists = 10
var magic_count = 1000
var loyalty_percent = 100
var prisoners_count = 0
var cultists_in_ritual = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (magic_count > cultists_in_ritual * 100):
		magic_count -= delta * (total_cultists - cultists_in_ritual)
	if (int(magic_count) == 0):
		print("Dead you are, try again you must.")
	if (cultists_in_ritual > total_cultists):
		$Cultist_Send.value = total_cultists
	available_cultists = total_cultists - cultists_in_ritual
	$cultist_label.text = "Cultists: " + str(available_cultists)
	$magic_label.text = "Magic: " + str(int(magic_count))
	$loyalty_bar.value = loyalty_percent
	$prisoners_label.text = "Prisoners: " + str(prisoners_count)
	cultists_in_ritual = $Cultist_Send.value
