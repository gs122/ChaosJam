extends Area2D
class_name Background;

var sprite: Sprite2D;

var startColor : Color = Color(1, 1, 1)  # White?
var endColor : Color = Color(1, 0, 0)    # Red
var fadeSpeed: float = 0.01;       # Duration of the fade in seconds

func _ready() -> void:
#	sprite = $BackgroundSprite;
#	backgroundSprite.modulate = startColor
	pass;

func _physics_process(delta):
#	var currentColor = backgroundSprite.
#	backgroundSprite.modulate = Color()
	pass;
