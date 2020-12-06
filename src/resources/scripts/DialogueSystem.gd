extends Resource
class_name DialogueSystem

var hud : DialogueHUD

func register_hud(new_hud : Control) -> void:
	hud = new_hud

func interact(target : Node, data : Interaction, solved : bool) -> void:
	print_debug("There was an interaction")
	if not hud:
		print_debug("No Dialogue hud has been registered")
		return
	if solved:
		interact_solved(data)
	else:
		interact_unsolved(data)

func interact_solved(data : Interaction) -> void:
	pass

func interact_unsolved(data : Interaction) -> void:
	var answers : Array = ["Okay", "Bye"]
	hud.show_prompt(data.initial_prompt, answers)
	var ans = yield(hud, "answered")
	print_debug(ans)
	
	
