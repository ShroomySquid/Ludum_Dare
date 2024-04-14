extends Button
signal b1_pressed

@onready var par = $".."
var available = false
var cost: Resource_container
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func load_cost(r: Resource_container):
	cost = r

func _on_Button_pressed():
	print("hello")
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var res = par.UI.available_cultists
	print(str(res))
	pass

