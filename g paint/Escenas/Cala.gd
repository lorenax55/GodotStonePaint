extends Node2D

var dialog_key = "cala"

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.emit_signal("display_dialog", dialog_key)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event.is_action_pressed("ui_accept"):
		print("siguiente cosa")
		SignalBus.emit_signal("display_dialog", dialog_key)
			
