extends Control
var available_cultists = 0
var total_cultists = 20
var magic_count = 1000
var peak_magic = 1000
var loyalty_percent = 100
var money_count = 10000
var prisoners_count = 0
var cultists_in_ritual = 10
var cultists_in_recruitment = 0
var cultists_in_job = 0
var global_timer = 0
var new_cultist_counter = 0

func _cultists_in_ritual(value: float):
	cultists_in_ritual = $Cultist_Send.value
	if (cultists_in_ritual > total_cultists - cultists_in_recruitment - cultists_in_job):
		cultists_in_ritual = total_cultists - cultists_in_recruitment - cultists_in_job
	$Cultist_Send.value = cultists_in_ritual

func _cultists_in_recruitment(value: float):
	cultists_in_recruitment = $Recruitment_Send.value
	if (cultists_in_recruitment > total_cultists - cultists_in_ritual - cultists_in_job):
		cultists_in_recruitment = total_cultists - cultists_in_ritual - cultists_in_job
	$Recruitment_Send.value = cultists_in_recruitment

func _cultists_in_job(value: float):
	cultists_in_job = $Job_Send.value
	if (cultists_in_job > total_cultists - cultists_in_recruitment - cultists_in_ritual):
		cultists_in_job = total_cultists - cultists_in_recruitment - cultists_in_ritual
	$Job_Send.value = cultists_in_job

# Called when the node enters the scene tree for the first time.
func _ready():
	$Cultist_Send.value = 10
	$Cultist_Send.value_changed.connect(self._cultists_in_ritual)
	$Recruitment_Send.value = cultists_in_recruitment
	$Recruitment_Send.value_changed.connect(self._cultists_in_recruitment)
	$Job_Send.value = cultists_in_job
	$Job_Send.value_changed.connect(self._cultists_in_job)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	money_count += 10 * delta * cultists_in_job
	global_timer += delta
	if (global_timer >= 900):
		print("Game complete.")
	if (magic_count >= cultists_in_ritual * 100):
		magic_count -= (magic_count - cultists_in_ritual * 100) * delta
	else:
		magic_count += (cultists_in_ritual * 100 - magic_count) * delta / 20
	new_cultist_counter += cultists_in_recruitment * delta
	if (new_cultist_counter >= 300):
		new_cultist_counter = 0
		total_cultists += 1
	if (int(magic_count) == 0):
		print("Dead you are, try again you must.")
	available_cultists = total_cultists - cultists_in_ritual - cultists_in_recruitment - cultists_in_job
	$cultist_label.text = "Cultists: " + str(available_cultists) + " / " + str(total_cultists)
	$magic_label.text = "Magic: " + str(int(magic_count))
	$loyalty_bar.value = loyalty_percent
	$prisoners_label.text = "Prisoners: " + str(prisoners_count)
	$money_label.text = "Money: " + str(int(money_count))
	if (magic_count > peak_magic):
		peak_magic = magic_count
	if (magic_count < peak_magic / 2):
		loyalty_percent -= delta
