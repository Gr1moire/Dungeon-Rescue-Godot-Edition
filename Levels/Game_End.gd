extends Node2D

var scene

func _ready():
	if PlayerVariables.mate1_is_taken && PlayerVariables.mate2_is_taken && PlayerVariables.mate3_is_taken:
		scene = Dialogic.start("good_end")
		scene.connect("timeline_end", self, "after_dialog")
	else:
		scene = Dialogic.start("bad_end")
		scene.connect("timeline_end", self, "after_dialog_bad")
	add_child(scene)

func after_dialog(timeline_name):
	get_tree().quit()

func after_dialog_bad(timeline_name):
	get_tree().change_scene("res://Levels/Level1.tscn")
