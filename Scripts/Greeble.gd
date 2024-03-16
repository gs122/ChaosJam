class_name Greeble
extends Area2D

var target: Meeble
var defaultSpeed: float = 70;
var speed: float = defaultSpeed;
var vel: Vector2
var myUI: MyUI;

var sfxPlayer;

# Called when the node enters the scene tree for the first time.

func _ready():
	sfxPlayer = get_parent().get_node("SFXPlayer");
	
	target = get_parent().get_node("Meeble");
	
	var current_scene = get_tree().get_current_scene()
	if current_scene:
		myUI = current_scene.get_node("MyUI")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if (target):
		move_towards(target.position, delta)
		
func move_towards(target_pos: Vector2, delta: float):
	var dirVec := (target_pos - position).normalized()
	vel = dirVec.normalized() * speed;
	position += vel * delta;


func _on_area_entered(area):
	if area is Attack:
		GameManager.score = GameManager.score+1;
		sfxPlayer.play();
		queue_free();
