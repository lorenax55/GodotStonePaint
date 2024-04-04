extends Node2D

@export var loveable: bool = false
@export var pnj_anim: SpriteFrames = null
@export var dialog_key = ""
@export var next_scene: String = ""


# Called when the node enters the scene tree for the first time.
func _ready():
	if loveable:
		$InteractIcon.play("Heart")
		$DialogBox.set_next_scene(next_scene)
	if pnj_anim != null:
		$PnjAnim.sprite_frames = pnj_anim
		$PnjAnim.play("Idle")
	$Area2D.set_dialog_key(dialog_key)
		


	




