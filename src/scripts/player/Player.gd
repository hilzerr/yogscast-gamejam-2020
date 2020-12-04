extends KinematicBody2D


export (int) var speed = 100

func _physics_process(delta : float) -> void:
	move_and_slide(get_movement_vector())

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
