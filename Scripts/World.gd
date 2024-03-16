extends Node2D
class_name World;

var greeble = preload("res://Scenes/greeble.tscn");

var timer: Timer;

var myRoom; 
var myRoomWidth;
var myRoomHeight;
var xSpawnPad = 25;
var ySpawnPad = 25;
var spawnLocations = [Vector2(0, 0),
Vector2(0, 0),
Vector2(0, 0),
Vector2(0, 0)];

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.score = 0;
	myRoom = $Room;
	timer = $SpawnTimer;
	
	myRoomWidth = 500;
	myRoomHeight = 500;
	spawnLocations = {
		0: Vector2(xSpawnPad,ySpawnPad), 
		1: Vector2(xSpawnPad, myRoomHeight-ySpawnPad), 
		2: Vector2(myRoomWidth-xSpawnPad, ySpawnPad),
		3: Vector2(myRoomWidth-xSpawnPad, myRoomHeight-ySpawnPad)
	}
	
	fourCornerSpawn(greeble);
	
	timer.start();
	
func _physics_process(delta):
	pass;

func fourCornerSpawn(objectToSpawn):
	var thisObject = objectToSpawn.instantiate();
	add_child(thisObject);
	
	var keys = spawnLocations.keys();
	var randNo = randi() % keys.size();
	var randKey = keys[randNo];
	
	thisObject.position = spawnLocations[randKey];


func _on_spawn_timer_timeout():
	fourCornerSpawn(greeble);
	timer.wait_time = timer.wait_time-0.003;
	print(str(timer.wait_time))
	timer.start();
