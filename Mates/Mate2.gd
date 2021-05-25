extends Area2D

const MUSIC_Pakal = preload("res://Music and Sounds/PAKAL.ogg")

func _on_Mate_body_entered(body):
	queue_free()
	PlayerVariables.mate2_is_taken = true
	get_node("../Background_Music").stream = MUSIC_Pakal
	get_node("../Background_Music").play()	
