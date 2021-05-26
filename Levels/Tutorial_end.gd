extends Area2D

var P1_Entered = false
var P2_Entered = false

var scene = Dialogic.start("tutorial")
		
func after_dialog(_timeline_name):
	get_tree().change_scene("res://Levels/Level1.tscn")

func _on_Tutorial_end_body_entered(body):
	if body == get_node("../Player"):
		P1_Entered = true
	if body == get_node("../Player2"):
		P2_Entered = true
	if (P1_Entered && P2_Entered):
		scene.connect("timeline_end", self, "after_dialog")
		get_parent().add_child(scene)

func _on_Tutorial_end_body_exited(body):
	if body == get_node("../Player"):
		P1_Entered = false
	if body == get_node("../Player2"):
		P2_Entered = false
