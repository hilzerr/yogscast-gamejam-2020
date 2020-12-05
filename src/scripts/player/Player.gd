extends KinematicBody2D
class_name Player

export (int) var speed = 100

onready var animation : AnimationPlayer = $icon/AnimationPlayer

func _ready():
	animation.play("walk_down")

func _physics_process(delta : float) -> void:
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
	var direction := Vector2()
	if Input.is_action_pressed("move_down"):
		direction += Vector2.DOWN
	if Input.is_action_pressed("move_up"):
		direction += Vector2.UP
	if Input.is_action_pressed("move_left"):
		direction += Vector2.LEFT
	if Input.is_action_pressed("move_right"):
		direction += Vector2.RIGHT
	if direction != Vector2():
		direction = direction.normalized() * speed
	return direction
