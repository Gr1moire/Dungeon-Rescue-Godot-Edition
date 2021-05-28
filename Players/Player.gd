extends KinematicBody2D

var velocity = Vector2.ZERO
signal movement_made

enum {LEFT, RIGHT, UP, DOWN, IDLE}

var can_move = true
var allow_move = false
var counter_x = 0
var counter_y = 0
var direction = IDLE

func _physics_process(_delta):
	if can_move:
		if Input.is_action_just_released("ui_right"):
			velocity.x = 1 #16
			get_parent().current_turn += 1
			emit_signal("movement_made")
			direction = RIGHT
			can_move = false

		elif Input.is_action_just_released("ui_left"):
			velocity.x = -1 #16
			get_parent().current_turn += 1
			emit_signal("movement_made")
			direction = LEFT
			can_move = false

		elif Input.is_action_just_released("ui_up"):
			velocity.y = -1 #-24
			get_parent().current_turn += 1
			emit_signal("movement_made")
			direction = UP
			can_move = false

		elif Input.is_action_just_released("ui_down"):
			velocity.y = 1 #24
			get_parent().current_turn += 1
			emit_signal("movement_made")
			direction = DOWN
			can_move = false
		elif Input.is_action_just_released("ui_end"):
			get_tree().reload_current_scene()

		else:
			velocity.x = 0
			velocity.y = 0
			direction = IDLE

	if !allow_move && !can_move:
		match direction:
			LEFT:
				allow_move = !test_move(get_transform(), velocity + Vector2(-16, 0))
			UP:
				allow_move = !test_move(get_transform(), velocity + Vector2(0, -24))
			DOWN:
				allow_move = !test_move(get_transform(), velocity + Vector2(0, 24))
			RIGHT:
				allow_move = !test_move(get_transform(), velocity + Vector2(16, 0))

	if direction == RIGHT || direction == LEFT:
		counter_x += 1
		if counter_x == 17:
			counter_x = 0
			direction = IDLE
			can_move = true
			allow_move = false

	if direction == UP || direction == DOWN:
		counter_y += 1
		if counter_y == 25:
			counter_y = 0
			direction = IDLE
			can_move = true
			allow_move = false
				
	if velocity && allow_move:
		move_and_collide(velocity)
		
	if get_parent().current_turn == get_parent().MAX_TURN:
		get_tree().reload_current_scene()
