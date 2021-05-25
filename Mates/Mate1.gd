extends Area2D

const MUSIC_lunya = preload("res://Music and Sounds/Lunya.ogg")

func _on_Mate_body_entered(_body):
	queue_free()
	PlayerVariables.mate1_is_taken = true
	get_node("../Background_Music").stream = MUSIC_lunya
	get_node("../Background_Music").play()	
