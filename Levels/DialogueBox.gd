 extends RichTextLabel

var dialogue = ["PAKAL:", "Tiens, vous êtes arrivés jusqu'ici.\nJe me nomme Patrick Armand Kalista Alexander de La Tour.",
				"PAKAL:", "Rejouissez-vous car le plus grand magicien de ces terres - si l'on omet une certaine nuisance moutonneuse - accepte de se joindre à vous.",
				"Prehe de Dator:", "Tais-toi et avance !"]
var page = 0
signal dialogue_started
signal dialogue_ended

func _ready():
	get_node("../CharacterName").set_bbcode(dialogue[page])
	set_bbcode(dialogue[page + 1])
	set_visible_characters(0)
	set_process_input(true)
	emit_signal("dialogue_started")

func _input(event):
	if event.is_action_pressed("ui_accept"):
		if get_visible_characters() > get_total_character_count():
			if page + 1 < dialogue.size() - 1:
				page += 2
				get_node("../CharacterName").set_bbcode(dialogue[page])
				set_bbcode(dialogue[page + 1])
				set_visible_characters(0)
			else:
				emit_signal("dialogue_ended")
		else:
			set_visible_characters(get_total_character_count())

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters() + 1)
