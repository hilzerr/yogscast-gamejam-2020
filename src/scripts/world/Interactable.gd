extends Sprite

signal solved

export (Resource) var interaction

var in_range : bool = false
export (bool) var solved = false

onready var dialogue_system : DialogueSystem = preload("res://resources/interactions/DialogueSystem.tres")

func _on_Area2D_body_entered(body : PhysicsBody2D) -> void:
	if body is Player:
		in_range = true

func _on_Area2D_body_exited(body : PhysicsBody2D) -> void:
	if body is Player:
		in_range = false

func _input(event : InputEvent) -> void:
	if in_range and event.is_action_pressed("interact"):
		dialogue_system.interact(self, interaction, solved)

func solve() -> void:
	solved = true
	emit_signal("solved")
