extends CharacterBody2D

const SPEED = 150.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var last_dir

func _physics_process(delta: float) -> void:
	
 
	var directionx := Input.get_axis("left", "right")
	if directionx > 0:
		position.x += directionx * SPEED * delta
		animated_sprite_2d.play("Walking_right")
		animated_sprite_2d.flip_h = false
		last_dir = 0
	elif directionx < 0:
		position.x += directionx * SPEED * delta
		animated_sprite_2d.play("Walking_right")
		animated_sprite_2d.flip_h = true
		last_dir = 1
	
	var directiony := Input.get_axis("up", "down")
	if directiony > 0:
		animated_sprite_2d.play("walking_front")
		position.y += directiony * SPEED * delta
		last_dir = 2
	elif directiony < 0:
		animated_sprite_2d.play("Walking_back")
		position.y += directiony * SPEED * delta
		last_dir = 3
	
	if directionx == 0 and directiony == 0:
		if last_dir == 0:
			animated_sprite_2d.play("Idle_right")
			animated_sprite_2d.flip_h = false
		elif last_dir == 1:
			animated_sprite_2d.play("Idle_right")
			animated_sprite_2d.flip_h = true
		elif last_dir == 2:
			animated_sprite_2d.play("Idle_front")
		elif last_dir == 3:
			animated_sprite_2d.play("Idle_back")

	move_and_slide()
