extends KinematicBody2D

var velocity = Vector2.ZERO

func _physics_process(delta):
	if Input.is_action_just_released("ui_right"):
		velocity.x = 16
	elif Input.is_action_just_released("ui_left"):
		velocity.x = -16
	elif Input.is_action_just_released("ui_up"):
		velocity.y = -24
	elif Input.is_action_just_released("ui_down"):
		velocity.y = 24
	else:
		velocity.x = 0
		velocity.y = 0
		
	if velocity && !test_move(get_transform(), velocity):
		move_and_collide(velocity)
