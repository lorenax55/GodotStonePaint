extends TextureButton

@export var my_image: Texture2D

var control = null
func _ready():
	control = get_node("../../PaintControl")

func _pressed():
	control.set_pegatina(my_image)
	print("selected brush")
