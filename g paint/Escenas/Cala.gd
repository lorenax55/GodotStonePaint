extends Node2D

var dialog_key = "cala"
var acabado = false
# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.end_dialog.connect(on_end_dialog)
	SignalBus.emit_signal("display_dialog", dialog_key)

func set_acabado():
	acabado = true
func on_end_dialog():
	$AnimationPlayer.play("new_animation")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event.is_action_pressed("ui_accept"):
		if acabado:
			get_tree().change_scene_to_file.bind("res://Escenas/Mapa_ini.tscn").call_deferred()
		else:
			SignalBus.emit_signal("display_dialog", dialog_key)
			
