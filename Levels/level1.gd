extends Node2D

const MAX_TURN = 20
var current_turn = 0

func _ready():
	PlayerVariables.mate1_is_taken = false
