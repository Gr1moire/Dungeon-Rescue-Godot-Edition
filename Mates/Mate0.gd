extends Area2D

const MUSIC_trisson = preload("res://Music and Sounds/Trisson1.ogg")

func _on_Mate_body_entered(_body):
	queue_free()
	get_node("../Background Music").stream = MUSIC_trisson
	get_node("../Background Music").play()	

