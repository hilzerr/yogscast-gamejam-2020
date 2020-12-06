extends Resource
class_name DialogueSystem

var hud : Control

func register_hud(UI : Control) -> void:
	hud = UI

func interact(target : Node, data : Interaction, solved : bool) -> void:
	print_debug("There was an interaction")
	if solved:
		interact_solved(data)

func interact_solved(data : Interaction) -> void:
	pass

