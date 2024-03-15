extends Label
class_name MyUI

var meeble: Meeble;
var label: Label;

var kills = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	var current_scene = get_tree().get_current_scene()
	if current_scene:
		meeble = current_scene.get_node("Meeble")
		label = current_scene.get_node("MyUI")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	label.text = "GREEBLES REKT: " + str(GameManager.score) + "\n" + "COUNTDOWN TO OBLIVION (health): " + str(meeble.hp);
	
func addKill():
	kills = kills+1;
