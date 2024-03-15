extends Control

var button: Button;

# Called when the node enters the scene tree for the first time.
func _ready():
	var current_scene = get_tree().get_current_scene()
	if current_scene:
		button = $PLAY;

	#button.text = "YOU KILLED ??? GREEBLES" + "\n" + "CLICK HERE TO RETURN TO CHAOS"
	button.text = "GAME OVER\n" + "CLICK HERE TO PLAY AGAIN" + "\n" + "\nYOU DESTROYED\n" + str(GameManager.score) + "\nGREEBLES BTW";


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_pressed():
	get_tree().change_scene_to_file("res://Level.tscn")


func _on_exit_pressed():
	get_tree().quit()
