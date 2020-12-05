extends Resource
class_name DialogueSystem

func interact(target : Node, data : Interaction, solved : bool) -> void:
	print_debug("There was an interaction")
