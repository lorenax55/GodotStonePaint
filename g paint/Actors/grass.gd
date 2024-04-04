extends AnimatedSprite2D

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	scale.x = rng.randf_range(0.6, 1.4)
	scale.y = rng.randf_range(0.6, 1.4)
	
	modulate = Color(rng.randf_range(0.8, 1),rng.randf_range(0.8, 1),rng.randf_range(0.8, 1),1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
