extends Control

@onready var main = $"../../UI"
#var resources: Resource_container = Resource_container.new()
func _process(_delta):
	pass

func _on_quit_pressed():
	get_tree().quit()

func _on_try_again_pressed():
	main.retry()

func _on_ui_end_game(score):
	#var score = resources.get_re(Resources.r.MAGIC)
	#$FinalScore.text = "Final score: "
	#print(score)
	if score < 1:
		score = 0
	$FinalScore.text = "Final score: " + str(int(score))
	if (score >= 1000000):
		$EndMsg.text = "Cori Tier"
	elif (score >= 100000):
		$EndMsg.text = "Damn good"
	elif (score >= 10000):
		$EndMsg.text = "It's alright"
	elif (score >= 1000):
		$EndMsg.text = "Noob"
	elif (score >= 100):
		$EndMsg.text = "This is worst than the starting score"
	elif (score >= 1):
		$EndMsg.text = "How"
	elif (score < 1):
		$EndMsg.text = "You are dead."
	pass