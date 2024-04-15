extends Control
class_name GAME
@onready var menu = $"../MenuLayer/Menu"
var resources: Resource_container = Resource_container.new()
@export var available_cultists = 10
var peak_magic = 1000
var cultists_in_ritual = 10
var cultists_in_recruitment = 0
var cultists_in_job = 0
var global_timer = 0
var new_cultist_counter = 0
var is_paused = true
var in_intro = true
var starve_timer = 1

func _cultists_in_ritual(value: float):
	if (is_paused == true):
		$Cultist_Send.value = cultists_in_ritual
	cultists_in_ritual = $Cultist_Send.value
	if (cultists_in_ritual > resources.get_re(Resources.r.CULTISTS) - cultists_in_recruitment - cultists_in_job):
		cultists_in_ritual = resources.get_re(Resources.r.CULTISTS) - cultists_in_recruitment - cultists_in_job
	$Cultist_Send.value = cultists_in_ritual

func _cultists_in_recruitment(value: float):
	if (is_paused == true):
		$Recruitment_Send.value = cultists_in_recruitment
	cultists_in_recruitment = $Recruitment_Send.value
	if (cultists_in_recruitment > resources.get_re(Resources.r.CULTISTS) - cultists_in_ritual - cultists_in_job):
		cultists_in_recruitment = resources.get_re(Resources.r.CULTISTS) - cultists_in_ritual - cultists_in_job
	$Recruitment_Send.value = cultists_in_recruitment

func _cultists_in_job(value: float):
	if (is_paused == true):
		$Job_Send.value = cultists_in_job
	cultists_in_job = $Job_Send.value
	if (cultists_in_job > resources.get_re(Resources.r.CULTISTS) - cultists_in_recruitment - cultists_in_ritual):
		cultists_in_job = resources.get_re(Resources.r.CULTISTS) - cultists_in_recruitment - cultists_in_ritual
	$Job_Send.value = cultists_in_job

func pauseMenu():
	if in_intro:
		return
	if is_paused:
		is_paused = false
		Engine.time_scale = 1
		menu.hide()
	else:
		is_paused = true
		Engine.time_scale = 0
		menu.show()

# Called when the node enters the scene tree for the first time.
func _ready():
	menu.hide()
	resources.set_re(Resources.r.CULTISTS, 20)
	resources.set_re(Resources.r.MAGIC, 1000)
	resources.set_re(Resources.r.LOYALTY, 100)
	resources.set_re(Resources.r.PRISONERS, 0)
	resources.set_re(Resources.r.GOLD, 10000)
	$Cultist_Send.value = cultists_in_ritual
	$Cultist_Send.value_changed.connect(self._cultists_in_ritual)
	$Recruitment_Send.value = cultists_in_recruitment
	$Recruitment_Send.value_changed.connect(self._cultists_in_recruitment)
	$Pause_Button.pressed.connect(self.pauseMenu)
	$Job_Send.value = cultists_in_job
	$Job_Send.value_changed.connect(self._cultists_in_job)
	Engine.time_scale = 0

func _endTuto():
	is_paused = false

func magic_gen(delta):
	var m = resources.get_re(Resources.r.MAGIC)
	var d = (m - cultists_in_ritual * 100)
	if d <= -1000:
		resources.sub_re(Resources.r.MAGIC, (d + 1000) * delta / 20)
	elif d > 0:
		resources.sub_re(Resources.r.MAGIC, d * delta / 20)

func update_labels():
	$cultist_label.text = "Cultists: " + str(available_cultists) + " / " + str(resources.get_re(Resources.r.CULTISTS))
	$magic_label.text = "Magic: " + str(int(resources.get_re(Resources.r.MAGIC)))
	$loyalty_bar.value = resources.get_re(Resources.r.LOYALTY)
	$prisoners_label.text = "Prisoners: " + str(resources.get_re(Resources.r.PRISONERS))
	$money_label.text = "Money: " + str(int(resources.get_re(Resources.r.GOLD))) + "$"
	$Event_Progress_1.get_node("Progress").value = get_parent().get_node("Event_manager").ongoing_event[0]
	if (global_timer < 180):
		$day_label.text = "Monday"
	elif (global_timer < 360):
		$day_label.text = "Tuesday"
	elif (global_timer < 540):
		$day_label.text = "Wednesday"
	elif (global_timer < 720):
		$day_label.text = "Tuesday"
	else:
		$day_label.text = "Friday"

func update_gold(delta):
	resources.add_re(Resources.r.GOLD, 10 * delta * cultists_in_job)
	resources.sub_re(Resources.r.GOLD, (resources.get_re(Resources.r.CULTISTS) - cultists_in_job) * delta * 4)
	if (resources.get_re(Resources.r.GOLD) <= 0):
		starve_timer -= delta
	else:
		starve_timer = 1
	if (starve_timer <= 0):
		resources.sub_re(Resources.r.CULTISTS, 1)
		starve_timer = 1

func update_cultists(delta):
	available_cultists = resources.get_re(Resources.r.CULTISTS) - cultists_in_ritual - cultists_in_recruitment - cultists_in_job
	if available_cultists < 0:
		if cultists_in_job + available_cultists >= 0:
			cultists_in_job += available_cultists
			$Job_Send.value = cultists_in_job
		elif cultists_in_ritual + available_cultists >= 0:
			cultists_in_ritual += available_cultists
			$Cultist_Send.value = cultists_in_ritual
		elif cultists_in_recruitment + available_cultists >= 0:
			cultists_in_recruitment += available_cultists
			$Job_Send.value = cultists_in_recruitment
		available_cultists = 0
		if resources.get_re(Resources.r.CULTISTS) == 0:
			print("There are no cultists left. You suck")
	new_cultist_counter += cultists_in_recruitment * delta
	if (new_cultist_counter >= 300):
		new_cultist_counter = 0
		resources.add_re(Resources.r.CULTISTS, 1)

func update_timer(delta):
	global_timer += delta
	if (global_timer >= 900):
		if (resources.get_re(Resources.r.MAGIC) >= 1000000):
			print("cori tier")
		elif (resources.get_re(Resources.r.MAGIC) >= 100000):
			print("damn good")
		elif (resources.get_re(Resources.r.MAGIC) >= 10000):
			print("fine")
		elif (resources.get_re(Resources.r.MAGIC) >= 1000):
			print("trash")
		elif (resources.get_re(Resources.r.MAGIC) >= 1000):
			print("you really bloody suck")
		elif (resources.get_re(Resources.r.MAGIC) >= 100):
			print("you didn't even try")
		elif (resources.get_re(Resources.r.MAGIC) >= 10):
			print("you had to try to be this bad")
		elif (resources.get_re(Resources.r.MAGIC) >= 1):
			print("how")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_labels()
	if (Input.is_action_just_pressed("pause") && in_intro == false):
		pauseMenu()
	if (is_paused == true):
		return
	update_gold(delta)
	update_cultists(delta)
	update_timer(delta)
	magic_gen(delta)
	update_timer(delta)
	if (int(resources.get_re(Resources.r.MAGIC)) == 0):
		print("Dead you are, try again you must.")
	if (resources.get_re(Resources.r.MAGIC) > peak_magic):
		peak_magic = resources.get_re(Resources.r.MAGIC)
	elif (resources.get_re(Resources.r.MAGIC) < peak_magic / 2):
		resources.sub_re(Resources.r.LOYALTY, delta)
