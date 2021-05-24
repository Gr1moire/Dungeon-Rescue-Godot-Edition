extends Control

onready var label = $Label

func set_label():
	label.text = "Turns: " + str(get_parent().MAX_TURN - get_parent().current_turn)	

func _ready():
	label.text = "Turns: " + str(get_parent().MAX_TURN - get_parent().current_turn)
	get_node("../Player").connect("movement_made", self, "set_label")
