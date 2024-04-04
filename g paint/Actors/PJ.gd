extends CharacterBody2D

const SPEED = 300.0
const BOBBING_HEIGHT = 10 # Altura máxima de bobbing
var rng = RandomNumberGenerator.new()
var current_animation = ""
var sprite_pj : AnimatedSprite2D = null

var bobbing_up = false
var bobbing_left = false


func _ready():
	sprite_pj = get_node("./Sprite_pj")
	


func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	var direction = Vector2.ZERO
	var pos = sprite_pj.position
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1

	if direction.length_squared() > 0:
		direction = direction.normalized()
		velocity = direction * SPEED
		
		# Cambiar la animación según la dirección
		var new_animation = ""
		if abs(direction.x) > abs(direction.y):
			if direction.x > 0:
				new_animation = "Walk_Left"
				sprite_pj.set_flip_h(true)
			else:
				new_animation  = "Walk_Left"
				sprite_pj.set_flip_h(false)
			#Bob up-down
			if not bobbing_up:
				bobbing_up = true	
				var tween = get_tree().create_tween()			
				var target_pos = sprite_pj.position + Vector2(0,BOBBING_HEIGHT)
				var target_pos1 = sprite_pj.position - Vector2(0,BOBBING_HEIGHT)
				tween.tween_property(sprite_pj, "position", target_pos1,0.06).set_ease(Tween.EASE_IN_OUT)
				tween.tween_property(sprite_pj, "position", target_pos,0.06).set_ease(Tween.EASE_IN_OUT)
				tween.parallel().tween_property(self,"bobbing_up", false, 0.12)
				tween.tween_property(sprite_pj, "position", Vector2(0,0),0.01)

		else:
			if direction.y > 0:
				new_animation  = "Walk_Front"
			else:
				new_animation  = "Walk_Back"
			#Bob left-right
			if not bobbing_left:
				bobbing_left = true
				#sprite_pj.rotation=0
				var tween = get_tree().create_tween()
				
				tween.tween_property(sprite_pj, "rotation", -0.08,0.04).set_ease(Tween.EASE_IN_OUT)
				tween.tween_property(sprite_pj, "rotation", +0.08,0.08).set_ease(Tween.EASE_IN_OUT)
				tween.tween_property(sprite_pj, "rotation", 0,0.04).set_ease(Tween.EASE_IN_OUT)
				
				tween.parallel().tween_property(self,"bobbing_left", false, 0.12)
				#tween.parallel().tween_property(sprite_pj,"rotation", 0, 0.001).set_delay(0.12)
				
				
		if new_animation != current_animation:
			sprite_pj.play(new_animation)
			current_animation = new_animation
		if(not $Footstep.is_playing()):
					$Footstep.pitch_scale=rng.randf_range(0.8, 1.3)
					$Footstep.play()
	else:
		$Footstep.stop()
		velocity = Vector2.ZERO
		bobbing_up = false
		bobbing_left = false
		sprite_pj.play("Idle")
		current_animation = "Idle"
	# Detener la animación si no se está moviendo



	move_and_slide()
