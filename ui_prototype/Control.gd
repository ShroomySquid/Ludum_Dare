extends Control
var available_cultists = 0
var total_cultists = 10
var magic_count = 1000
var loyalty_percent = 100
var prisoners_count = 0
var cultists_in_ritual = 10
var cultists_in_recruitment = 0

func _cultists_in_ritual(value: float):
	cultists_in_ritual = $Cultist_Send.value
	if (cultists_in_ritual > total_cultists - cultists_in_recruitment):
		cultists_in_ritual = total_cultists - cultists_in_recruitment
	$Cultist_Send.value = cultists_in_ritual

func _cultists_in_recruitment(value: float):
	cultists_in_recruitment = $Recruitment_Send.value
	if (cultists_in_recruitment > total_cultists - cultists_in_ritual):
		cultists_in_recruitment = total_cultists - cultists_in_ritual
	$Recruitment_Send.value = cultists_in_recruitment

# Called when the node enters the scene tree for the first time.
func _ready():
	$Cultist_Send.value = 10
	$Cultist_Send.value_changed.connect(self._cultists_in_ritual)
	$Recruitment_Send.value = 10
	$Recruitment_Send.value_changed.connect(self._cultists_in_recruitment)
	$Recruitment_Send.value = cultists_in_recruitment

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (magic_count >= cultists_in_ritual * 100):
		magic_count -= (magic_count - cultists_in_ritual * 100) * delta
	else:
		magic_count += (cultists_in_ritual * 100 - magic_count) * delta
	if (int(magic_count) == 0):
		print("Dead you are, try again you must.")
	available_cultists = total_cultists - cultists_in_ritual - cultists_in_recruitment
	$cultist_label.text = "Available cultists: " + str(available_cultists)
	$magic_label.text = "Magic: " + str(int(magic_count))
	$loyalty_bar.value = loyalty_percent
	$prisoners_label.text = "Prisoners: " + str(prisoners_count)
