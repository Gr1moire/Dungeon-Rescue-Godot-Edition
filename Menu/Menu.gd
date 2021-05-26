extends MarginContainer

const tutorial_scene = preload("res://Levels/Tutorial.tscn")
const level1_scene = preload("res://Levels/Level1.tscn")

onready var selector_one   = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/Tutorial/HBoxContainer/Selector
onready var selector_two   = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/Start/HBoxContainer/Selector
onready var selector_three = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/Exit/HBoxContainer/Selector

onready var  tutorial = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/Tutorial/HBoxContainer/Tutorial
onready var start = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/Start/HBoxContainer/Start
onready var exit = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/Exit/HBoxContainer/Exit

var selection = 0

func _ready():
	set_current_selection(0)

func _physics_process(_delta):
	if Input.is_action_just_pressed("ui_down") && selection < 2:
		selection += 1
		set_current_selection(selection)
	if Input.is_action_just_pressed("ui_up") && selection > 0:
		selection -= 1
		set_current_selection(selection)
	if Input.is_action_just_pressed("ui_accept"):
		make_selection()

func set_current_selection(_current_selection):
	reset_label()
	if _current_selection == 0:
		selector_one.text = ">"
		tutorial.modulate = Color(255, 0, 0, 255)
	elif _current_selection == 1:
		selector_two.text = ">"
		start.modulate = Color(255, 0, 0, 255)
	elif _current_selection == 2:
		selector_three.text = ">"
		exit.modulate = Color(255, 0, 0, 255)

func reset_label():
	selector_one.text = ""
	selector_two.text = ""
	selector_three.text = ""
	tutorial.modulate = Color(1, 1, 1, 255)
	start.modulate = Color(1, 1, 1, 255)
	exit.modulate = Color(1, 1, 1, 255)

func make_selection():
	if selection == 0:
		get_parent().add_child(tutorial_scene.instance())
		queue_free()
	if selection == 1:
		get_parent().add_child(level1_scene.instance())
		queue_free()
	if selection == 2:
		get_tree().quit()
