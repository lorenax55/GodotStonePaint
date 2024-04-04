extends Area2D
var dialog_key = ""
var player = null
var anim_player = null
var loveable = false

var icon = null
var canTalk = false


# Importa el nodo del personaje para comparar el cuerpo que entra en el área
func set_loveable(val):
	loveable = val

func _ready():
	player = get_node("../../Pj")
	anim_player = get_node("../AnimationPlayer")


	icon = get_node("../InteractIcon")
	print("tengo al jugador ", player)

func set_dialog_key(key):
	dialog_key = key 

func _on_body_entered(body):
	# Verifica si el cuerpo que entra en el área es el personaje
	if body == player:
		anim_player.play("Interaction_anim")
		$pop.play()
		canTalk = true

func _on_body_exited(body):
	# Verifica si el cuerpo que entra en el área es el personaje
	if body == player:
		anim_player.play_backwards("Interaction_anim")
		canTalk = false
		$woosh.play()

func _input(event):
	if canTalk and event.is_action_pressed("ui_accept"):
		print("siguiente cosa")
		SignalBus.emit_signal("display_dialog", dialog_key)
		#if icon.is_visible_in_tree() && loveable:
			
			
		
