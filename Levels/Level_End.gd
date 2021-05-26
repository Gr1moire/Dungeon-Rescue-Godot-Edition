extends Area2D

var P1_Entered = false
var P2_Entered = false

var scene = Dialogic.start("level1")

func _on_Level_End_body_entered(body):
	if body == get_node("../Player"):
		P1_Entered = true
	if body == get_node("../Player2"):
		P2_Entered = true
	if (P1_Entered && P2_Entered):
		scene.connect("timeline_end", self, "after_dialog")
		get_parent().add_child(scene)
		get_node("../Player").queue_free()
		get_node("../Player2").queue_free()

func _on_Level_End_body_exited(body):
	if body == get_node("../Player"):
		P1_Entered = false
	if body == get_node("../Player2"):
		P2_Entered = false

func after_dialog(_timeline_name):
	get_tree().change_scene("res://Levels/Level2.tscn")
