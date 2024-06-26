extends Window

var loaded_event: Event_container = Event_container.new()
var queue = []
var active = false

# Called when the node enters the scene tree for the first time.
func _ready():
	print("I EXIST")
	self.add_theme_icon_override("close", Texture2D.new())
	self.hide()

func load_e():
	active = true
	loaded_event = queue[0]
	if loaded_event.choice == 1:
		$speech.text = loaded_event.conclusion_1
	if loaded_event.choice == 2:
		$speech.text = loaded_event.conclusion_2
	if loaded_event.choice == 3:
		$speech.text = loaded_event.conclusion_3
	self.show()

func conclude():
	queue.pop_front()
	if !queue.is_empty():
		load_e()
	else:
		self.hide()
		active = false

func add_event(e:Event_container):
	queue.append(e)
	if !active:
		load_e()

