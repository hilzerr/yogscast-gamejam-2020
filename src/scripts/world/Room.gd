extends Area2D
class_name Room

export (String) var room_name = "Base Room"
export (Array, String) var requirements = ["Start"]
export (bool) var locked = false

onready var doors : Dictionary = {
	"LEFT" : {
		"open_state" : 25,
		"closed_state" : 26,
		"flip_x" : false,
		"flip_y" : false,
		"tile_pos" : Vector2(0,5),
		"shape" : $DoorLeft/CollisionShape2D
	},
	"RIGHT" : {
		"open_state" : 25,
		"closed_state" : 26,
		"flip_x" : true,
		"flip_y" : false,
		"tile_pos" : Vector2(17,5),
		"shape" : $DoorRight/CollisionShape2D
	}
}

enum door_states {
	SIDEWAYS_OPEN = 25,
	SIDEWAYS_CLOSED = 26
}

func _ready() -> void:
	if not locked:
		_on_unlock()

func _on_unlock() -> void:
	for dir in doors:
		var door = doors[dir]
		$Layer1.set_cellv(door.tile_pos, door.open_state, door.flip_x, door.flip_y)
		(door.shape as CollisionShape2D).disabled = false


func _on_Door_body_entered(body : Player) -> void:
	body.set_collision_mask_bit(1, false)


func _on_Door_body_exited(body : Player) -> void:
	body.set_collision_mask_bit(1, true)
