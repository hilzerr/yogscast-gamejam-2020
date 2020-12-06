extends VBoxContainer
class_name DialogueHUD

signal answered(answer)

var dialogue_system

onready var answer_box : VBoxContainer = $HBoxContainer/Answers
onready var prompt_panel : PanelContainer = $PromptPanel
onready var prompt_label : Label = $PromptPanel/Prompt

func _ready() -> void:
	hide()
	dialogue_system = load("res://resources/interactions/DialogueSystem.tres")
	dialogue_system.register_hud(self)

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

func _on_answer(answer : String) -> void:
	emit_signal("answered", answer)
	hide()
	
