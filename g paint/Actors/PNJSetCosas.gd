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

func on_end_dialog():
	if(loveable):
		get_tree().change_scene_to_file.bind(next_scene).call_deferred()

	#get_tree().change_scene_to_file("res://Escenas/Cala.tscn")


