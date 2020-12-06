extends Resource
class_name DialogueSystem

signal good_deed
signal bad_deed
signal prompted(message, answers)
signal answer_recieved(answer)
signal interaction_completed(success)



const inventory : Inventory = preload("res://resources/Inventory.tres")



func interact(data : Interaction, solved : bool) -> void:
	if solved == true:
		interact_solved(data)
	else:
		interact_unsolved(data)
	
func _on_answered(ans : String) -> void:
	emit_signal("answer_recieved", ans)

func interact_solved(data : Interaction) -> void:
	emit_signal("prompted", data.solved_prompt, ["Okay"])
	print_debug("Waiting for answer")
	var ans = yield(self, "answer_recieved")
	print_debug("Answer recieved: %s" % ans)
	emit_signal("prompted", data.solved_answer, ["Bye"])
	emit_signal("interaction_completed", true)

func interact_unsolved(data : Interaction) -> void:
	# Construct initial prompt
	var items = generate_item_answers(data)
	var answers : Array = items.keys()
	answers.shuffle()
	answers.append("Do nothing")
	# Show prompt and wait for answer
	emit_signal("prompted", data.initial_prompt, answers)
	var reply = yield(self, "answer_recieved")
	# No interaction
	if reply == "Do nothing":
		emit_signal("prompted", data.no_answer, ["Bye"])
		emit_signal("interaction_completed", false)
		return
	# Get item
	if not data.require_item:
		inventory.add_item(items[reply])
		emit_signal("prompted", data.good_answer, ["Bye"])
		emit_signal("interaction_completed", false)
		return
	# Use item
#	inventory.remove_item(inventory.get_indexes_for(items[reply])[0])
	print_debug(items[reply])
	print_debug(inventory.get_indexes_for(items[reply]))
	print_debug(inventory.items)
	var index = inventory.get_indexes_for(items[reply])[0]
	print_debug(index)
	inventory.remove_item(index)
	print_debug(inventory.items)
	
	if items[reply] in data.good_items:
		emit_signal("prompted", data.good_answer, ["Yay!"])
		emit_signal("good_deed")
	else:
#		hud.show_prompt(data.bad_answer, ["Oh no!"])
		emit_signal("prompted", data.bad_answer, ["Oh no!"])
		emit_signal("bad_deed")
	emit_signal("interaction_completed", true)

func generate_item_answers(data : Interaction) -> Dictionary:
	var items := {}
	if data.require_item:
		for item in data.bad_items + data.good_items:
			if item in inventory.items:
				items["Use " + (item as Item).name] = item
	else:
		for item in data.bad_items + data.good_items:
			items["Take " + (item as Item).name] = item
	return items

