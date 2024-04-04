extends Node2D

@export var loveable: bool = false
@export var pnj_anim: SpriteFrames = null
@export var dialog_key = ""
@export var next_scene: String = ""


# Called when the node enters the scene tree for the first time.
func _ready():	

	SignalBus.end_dialog.connect(on_end_dialog)
	if loveable:
		$InteractIcon.play("Heart")
	if pnj_anim != null:
		$PnjAnim.sprite_frames = pnj_anim
		$PnjAnim.play("Idle")
	$Area2D.set_dialog_key(dialog_key)
	if(loveable):
		$DialogBox.set_next_scene(next_scene)

func on_end_dialog():
	print("ended dialog")
	




