extends VBoxContainer
class_name DialogueHUD

signal answered(answer)

const dialogue_system = preload("res://resources/interactions/DialogueSystem.tres")

onready var answer_box : VBoxContainer = $HBoxContainer/Answers
onready var prompt_panel : PanelContainer = $PromptPanel
onready var prompt_label : Label = $PromptPanel/Prompt

func _ready() -> void:
	hide()
	release_focus()
	dialogue_system.connect("prompted", self, "show_prompt")
	connect("answered", dialogue_system, "_on_answered")

func show_prompt(message : String, answers : Array) -> void:
	prompt_label.text = message
	for old_ans in answer_box.get_children():
		old_ans.queue_free()
	for ans in answers:
		var btn := Button.new()
		btn.text = ans
		btn.connect("button_down", self, "_on_answer", [ans])
		answer_box.add_child(btn)
	show()
	grab_focus()

func _on_answer(answer : String) -> void:
	release_focus()
	hide()
	emit_signal("answered", answer)
	
func _gui_input(event : InputEvent) -> void:
	accept_event()
