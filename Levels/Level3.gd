extends Node2D

const MAX_TURN = 48
var current_turn = 0

func _ready():
	PlayerVariables.mate2_is_taken = false
