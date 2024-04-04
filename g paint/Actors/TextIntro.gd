extends Node2D


var has_played_jump = 0

func _input(event):
	if event is InputEventKey:
		if event.pressed:
			var animation_player = $AnimationPlayer
			
			if has_played_jump == 0:
				# Saltar al segundo 8.5 de la animación
				animation_player.seek(1.2)
				# Reproducir la animación desde el segundo 8.5
				animation_player.play("new_animation")
				# Marcar que se ha reproducido el salto
				has_played_jump = 1
				
			elif has_played_jump == 1:
				# Saltar al segundo 8.5 de la animación
				animation_player.seek(4)
				# Reproducir la animación desde el segundo 8.5
				animation_player.play("new_animation")
				# Marcar que se ha reproducido el salto
				has_played_jump = 2
				
			elif has_played_jump == 2:
				# Saltar al segundo 8.5 de la animación
				animation_player.seek(6.7)
				# Reproducir la animación desde el segundo 8.5
				animation_player.play("new_animation")
				# Marcar que se ha reproducido el salto
				has_played_jump = 3
				
			elif has_played_jump == 3:
				# Saltar al segundo 8.5 de la animación
				animation_player.seek(8.5)
				# Reproducir la animación desde el segundo 8.5
				animation_player.play("new_animation")
				# Marcar que se ha reproducido el salto
				has_played_jump = 4

func finish():
	var camara = get_node("../Camera2D")
	camara.set_active()

func set_has_played_jump(val):
	has_played_jump = val
