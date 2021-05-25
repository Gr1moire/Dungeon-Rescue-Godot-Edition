extends KinematicBody2D

var velocity = Vector2.ZERO

enum {LEFT, RIGHT, UP, DOWN, IDLE}

var can_move = true
var allow_move = false
var direction = IDLE
var counter_x = 0
var counter_y = 0

func _physics_process(_delta):
	if can_move:
		if Input.is_action_just_released("ui_right"):
			velocity.x = 1 #16
			direction = RIGHT
			can_move = false

		elif Input.is_action_just_released("ui_left"):
			velocity.x = -1 #16
			direction = LEFT
			can_move = false

		elif Input.is_action_just_released("ui_up"):
			velocity.y = -1 #-24
			direction = UP
			can_move = false

		elif Input.is_action_just_released("ui_down"):
			velocity.y = 1 #24
			direction = DOWN
			can_move = false

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
