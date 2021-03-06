extends Area2D

var P1_Entered = false
var P2_Entered = false
var scene = Dialogic.start("level2")

func _on_Level_end_body_entered(body):
	if body == get_node("../Player"):
		P1_Entered = true
	if body == get_node("../Player2"):
		P2_Entered = true
	if (P1_Entered && P2_Entered):
		if PlayerVariables.mate2_is_taken:
			scene.connect("timeline_end", self, "after_dialog")
			get_parent().add_child(scene)
			get_node("../Player").queue_free()
			get_node("../Player2").queue_free()
		else:
			after_dialog("")

func _on_Level_end_body_exited(body):
	if body == get_node("../Player"):
		P1_Entered = false
	if body == get_node("../Player2"):
		P2_Entered = false

func after_dialog(timeline_name):
	get_tree().change_scene("res://Levels/Level3.tscn")
