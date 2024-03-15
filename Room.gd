extends Area2D
class_name Room;

var roomCollisionShape;
var roomWidth; 
var roomHeight;

# Called when the node enters the scene tree for the first time.
func _ready():
	roomCollisionShape = $RoomCollisionShape;
	roomWidth = roomCollisionShape.shape.get_rect().size.x*2;
	roomHeight = roomCollisionShape.shape.get_rect().size.y*2;
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
