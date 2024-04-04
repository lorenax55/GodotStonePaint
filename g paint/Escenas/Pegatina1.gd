extends TextureButton

@export var my_image: Texture2D

var control = null
func _ready():
	control = get_node("../../PaintControl")

func _pressed():
	control.set_pegatina(my_image)
	print("selected brush")
	
	var tween = get_tree().create_tween()
	tween.tween_property(self, "scale", Vector2(0.08,0.08),0.2).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_QUAD)
	tween.tween_property(self, "scale", Vector2(0.06,0.06),0.1).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_QUAD)

