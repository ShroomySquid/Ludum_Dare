extends Window

var loaded_event: Event_container = Event_container.new()
var queue = []
var active = false

# Called when the node enters the scene tree for the first time.
func _ready():
	self.add_theme_icon_override("close", Texture2D.new())
	self.hide()
	#gui_embed_subwindows = true
	pass # Replace with function body.

func load_e():
	active = true
	loaded_event = queue[0]
	$speech.text = loaded_event.conclusion_1
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

