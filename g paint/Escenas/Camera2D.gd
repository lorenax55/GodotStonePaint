extends Camera2D

# La velocidad a la que la cámara sigue al personaje.
var follow_speed = 5.0
var active = false
#const OFFSET = Vector2(0,0)

# El nodo que sigue la cámara (en este caso, el personaje).
var target_node = null

# La posición máxima a la que puede llegar la cámara en el eje X e Y.
var max_camera_position = Vector2(5760-1920*0.5, 2700-1080*0.5) # Ajusta estos valores según el tamaño máximo de tu mapa.
var min_camera_position = Vector2(1920*0.5, 1080*0.5) # Ajusta estos valores según el tamaño máximo de tu mapa.

func set_active():
	active = true

func _process(delta):
	# Si no se ha establecido un objetivo, no hacemos nada.
	if not target_node or not active:
		return

	# Obtenemos la posición actual de la cámara.
	var current_position = global_position

	# Obtenemos la posición del objetivo.
	var target_position = target_node.global_position

	# Interpolamos entre la posición actual de la cámara y la posición del objetivo
	# para que el movimiento sea suave.
	current_position = current_position.lerp(target_position, follow_speed * delta)

	# Limitar la posición de la cámara dentro de los límites máximos.
	current_position.x = clamp(current_position.x, 0, max_camera_position.x)
	current_position.y = clamp(current_position.y, 0, max_camera_position.y)
	
	current_position.x = max(current_position.x, 0, min_camera_position.x)
	current_position.y = max(current_position.y, 0, min_camera_position.y)

	# Establecemos la nueva posición de la cámara.
	global_position = current_position
	
func _ready():
	# Buscamos el nodo del personaje en la escena.
	target_node = get_node("../Pj")
