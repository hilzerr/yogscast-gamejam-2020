extends KinematicBody2D
class_name Player

export (int) var speed = 100

onready var animation : AnimationPlayer = $icon/AnimationPlayer

var direction : Vector2 = Vector2()

func _ready():
	animation.play("walk_down")

func _physics_process(_delta : float) -> void:
	var moved := move_and_slide(get_movement_vector())
	if moved.normalized() == Vector2.UP:
		animation.play("walk_up")
	elif moved.x < 0:
		animation.play("walk_left")
	elif moved.x > 0:
		animation.play("walk_right")
	else:
		animation.play("walk_down")
	
func get_movement_vector() -> Vector2:
	var movement := Vector2()
	movement = direction.normalized() * speed
	return movement
	

func _unhandled_input(event : InputEvent) -> void:
	if event.is_action_pressed("move_down"):
		direction.y += 1
	if event.is_action_pressed("move_up"):
		direction.y -= 1
	if event.is_action_pressed("move_left"):
		direction.x -= 1
	if event.is_action_pressed("move_right"):
		direction.x += 1
	if event.is_action_released("move_down"):
		direction.y -= 1
	if event.is_action_released("move_up"):
		direction.y += 1
	if event.is_action_released("move_left"):
		direction.x += 1
	if event.is_action_released("move_right"):
		direction.x -= 1
	direction.x = clamp(direction.x, -1, 1)
	direction.y = clamp(direction.y, -1, 1)
