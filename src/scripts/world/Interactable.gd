extends Node2D

signal interaction_completed(success)
signal interaction_solved

export (Resource) var interaction
export (bool) var locks_room = false
export (bool) var solved = false

var in_range : bool = false


const dialogue_system : DialogueSystem = preload("res://resources/interactions/DialogueSystem.tres")

func _ready() -> void:
	dialogue_system.connect("interaction_completed", self, "_on_interaction_completed")

func _on_Area2D_body_entered(body : PhysicsBody2D) -> void:
	if body is Player:
		in_range = true

func _on_Area2D_body_exited(body : PhysicsBody2D) -> void:
	if body is Player:
		in_range = false

func _unhandled_input(event : InputEvent) -> void:
	if in_range and event.is_action_pressed("interact"):
		dialogue_system.interact(interaction, solved)
		var success : bool = yield(self, "interaction_completed")
		solved = success
		if solved:
			emit_signal("interaction_solved")

func _on_interaction_completed(success : bool) -> void:
	emit_signal("interaction_completed", success)
