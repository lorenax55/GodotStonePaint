extends Area2D

var player = null
var icon = null
var canInteract = false

func _ready():
	player = get_node("../Pj")
	icon = get_node("./InteractIcon")
	#print(player)
	#print(icon)

func _on_body_entered(body):
	if body == player:
		icon.visible = true
		canInteract = true

func _on_body_exited(body):
	if body == player:
		icon.visible = false
		canInteract = false

func abrir_paint():
	get_tree().change_scene_to_file("res://Escenas/paint_root.tscn")

func _input(event):
	if canInteract and event.is_action_pressed("ui_accept"):
		abrir_paint()
		
		
