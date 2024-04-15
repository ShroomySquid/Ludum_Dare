extends Window

const ALL_TXT = 4

var file_paths = [
	'res://Intro/intro_texts/intro1.txt',
	'res://Intro/intro_texts/intro2.txt',
	'res://Intro/intro_texts/intro3.txt',
	'res://Intro/intro_texts/intro4.txt'
]

var i = 0
var texts = [
	"",
	"",
	"",
	""
]

const intro_first = "WELCOME

You are <player_name>"

# Called when the node enters the scene tree for the first time.
func _ready():
	self.add_theme_icon_override("close", Texture2D.new())
	self.hide()
	load_file(file_paths)
	#var content = ""
	#var i = 0
	#self.add_theme_icon_override("close", Texture2D.new())
	#if file.file_exists(file_paths[i]):
		#var error = file.open(file_paths[i], File.READ)
		#if error == OK:m
			## Read the content of the file
			#content = file.get_as_text()
			#file.close()
		#else:
			#print("Error opening file:", file_paths[i])
	#else:
		#print("File not found:", file_paths[i])
	var label_node = get_node("text")
	if label_node != null:
		label_node.text = intro_first + texts[0]
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_s_key_pressed():
	get_parent().get_node("UI").is_paused = false
	get_parent().get_node("UI").in_intro = false
	Engine.time_scale = 1
	self.hide()
	pass


#func load_file(file_paths):
	#var file
	#var j = 0
	#while j < ALL_TXT:
		#file = FileAccess.open(file_paths[j], FileAccess.READ)
		#texts[j] += file.get_as_text()
		#j += 1
	#pass
	
func load_file(file_paths: Array) -> void:
	var j = 0
	while j < file_paths.size():
		var file = FileAccess.open(file_paths[j], FileAccess.READ)
		var file_path = file_paths[j]
		#var error = file.open(file_paths[j], FileAccess.READ)
		#if error != OK:
			#print("Error opening file:", file_path)
			## Handle error (e.g., skip file, break loop, etc.)
			#j += 1
			#continue
		
		# Read file content
		var file_content = file.get_as_text()
		texts[j] = file_content
		
		# Close the file
		file.close()

		j += 1
	pass


func _on_button_pressed():
	i += 1
	if i >= ALL_TXT:
		get_parent().get_node("UI").is_paused = false
		get_parent().get_node("UI").in_intro = false
		Engine.time_scale = 1
		self.hide()
		pass
	else:
		var label_node = get_node("intro_label")
		if label_node != null:
			label_node.text = texts[i]
		pass
		



func _on_skip_button_pressed():
	get_parent().get_node("UI").is_paused = false
	get_parent().get_node("UI").in_intro = false
	Engine.time_scale = 1
	self.hide()
	pass


func _on_line_edit_game_start():
	self.show()
