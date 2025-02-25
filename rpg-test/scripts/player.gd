extends CharacterBody2D

const SPEED = 150.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionx := Input.get_axis("left", "right")
	if directionx > 0:
		position.x += directionx * SPEED * delta
		animated_sprite_2d.play("Walking_right")
		animated_sprite_2d.flip_h = false
	elif directionx < 0:
		position.x += directionx * SPEED * delta
		animated_sprite_2d.play("Walking_right")
		animated_sprite_2d.flip_h = true
	
	var directiony := Input.get_axis("up", "down")
	if directiony > 0:
		animated_sprite_2d.play("walking_front")
		position.y += directiony * SPEED * delta
	elif directiony < 0:
		animated_sprite_2d.play("Walking_back")
		position.y += directiony * SPEED * delta

	move_and_slide()
