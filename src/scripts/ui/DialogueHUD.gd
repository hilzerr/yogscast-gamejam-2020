extends Control

onready var dialogue_system : DialogueSystem = preload("res://resources/interactions/DialogueSystem.tres")

onready var answer_box : VBoxContainer = $VBoxContainer/HBoxContainer/Answers
onready var prompt_panel : PanelContainer = $VBoxContainer/PromptPanel
onready var prompt : Label = $VBoxContainer/PromptPanel/Prompt


func show_prompt(message : String, answers : Array) -> void:
	prompt.text = message
	prompt_panel.show()
	for ans in answers:
		var btn := Button.new()
		btn.text = ans
		btn.connect("button_down", self, "_on_answer", [ans])
		answer_box.add_child(btn)

func _on_answer(answer : String) -> void:
	print_debug(answer)
