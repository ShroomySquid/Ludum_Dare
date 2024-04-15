extends Button
signal b2_pressed

@onready var par = $".."
var available = false
var cost: Resource_container = Resource_container.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func load_cost(r: Resource_container):
	cost = Resource_container.new(r.basket)

func _on_pressed():
	print("hello")
	#par.UI.resources = Resource_container.combine(par.UI.resources, cost)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if (!Resource_container.compare(par.UI.resources, cost) || par.UI.available_cultists < - cost.get_re(Resources.r.CULTISTS)):
		disabled = true
	else:
		disabled = false
	pass
