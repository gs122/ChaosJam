class_name Meeble
extends Area2D

var attackSprite;

var speed: float = 400;
var vel := Vector2(0,0);
var hp: int = 4;
var timer;

var myCamera;

# Called when the node enters the scene tree for the first time.
func _ready():
	myCamera = get_parent().get_node("MyCamera");
	timer = get_parent().get_node("WeaponTimer");
	attackSprite = get_node("Attack/AttackSprite");

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
#	if Input.is_action_pressed("restart"):
#		get_tree().reload_current_scene();
	
	var dirVec := Vector2(0, 0);
	
	if Input.is_action_pressed("move_left"):
		dirVec.x = -1;
	if Input.is_action_pressed("move_right"):
		dirVec.x = 1;
	if Input.is_action_pressed("move_up"):
		dirVec.y = -1;
	if Input.is_action_pressed("move_down"):
		dirVec.y = 1;

	vel = dirVec.normalized() * speed;
	position += vel * delta;
	
	
	
	position.x = clamp(position.x, 0, 500)
	position.y = clamp(position.y, 0, 500)
	
	
func randomizeWeapon():
	rotation = randi_range(0, 360);
	
	var tot_frames = 26;
	attackSprite.frame = randi_range(0, tot_frames - 1)

func _on_weapon_timer_timeout():
	randomizeWeapon();
	timer.start();

func _on_area_entered(area):
	if area is Greeble:
		print("made contact with greeble")
		myCamera.shake(0.2, 15, 64);
		hp -= 1;
		area.queue_free();
		if hp < 1:
			hp = 0;
			get_tree().change_scene_to_file("res://Scenes/GameOver.tscn")
