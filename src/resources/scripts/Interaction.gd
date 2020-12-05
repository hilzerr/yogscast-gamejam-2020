extends Resource
class_name Interaction

# Is there an item needed for sucessful interaction?
export (bool) var require_item = false
export (Array, Resource) var bad_items = Array()
export (Array, Resource) var good_items = Array()

export (String, MULTILINE) var initial_prompt = "This interaction has not been solved yet"
export (String, MULTILINE) var bad_answer = "This interaction was naughty"
export (String, MULTILINE) var good_answer = "This interaction was nice"
export (String, MULTILINE) var no_answer = "This interaction was unsuccessful"

export (String, MULTILINE) var solved_prompt = "This interaction has already been solved"
export (String, MULTILINE) var solved_answer = "You leave the solved interaction"
