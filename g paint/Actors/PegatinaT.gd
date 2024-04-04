extends Sprite2D
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "scale", Vector2(1.2,1.2),0.2).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_QUAD)
	tween.tween_property(self, "scale", Vector2(1,1),0.1).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_QUAD)
	rotation = rng.randf_range(-1, 1)

func set_pegatinaT(mouse_pos, my_texture):
	position = mouse_pos
	texture = my_texture

