extends Area2D

const MUSIC_Levie = preload("res://Music and Sounds/Levie.ogg")

func _on_Mate3_body_entered(body):
	queue_free()
	PlayerVariables.mate3_is_taken = true
	get_node("../Background_Music").stream = MUSIC_Levie
	get_node("../Background_Music").play()	
