extends KinematicBody2D

var velocity = Vector2.ZERO
signal movement_made

func _physics_process(delta):
	if Input.is_action_just_released("ui_right"):
		velocity.x = 16
		get_parent().current_turn += 1
		emit_signal("movement_made")

	elif Input.is_action_just_released("ui_left"):
		velocity.x = -16
		get_parent().current_turn += 1
		emit_signal("movement_made")

	elif Input.is_action_just_released("ui_up"):
		velocity.y = -24
		get_parent().current_turn += 1
		emit_signal("movement_made")

	elif Input.is_action_just_released("ui_down"):
		velocity.y = 24
		get_parent().current_turn += 1
		emit_signal("movement_made")		

	else:
		velocity.x = 0
		velocity.y = 0
		
	if velocity && !test_move(get_transform(), velocity):
		move_and_collide(velocity)
		
	if get_parent().current_turn == get_parent().MAX_TURN:
		get_tree().reload_current_scene()
