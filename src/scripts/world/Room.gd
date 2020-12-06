extends Area2D
class_name Room

const DOORS = {
	"UP" : [Vector2(8,0)],
	"RIGHT" : [Vector2(17,5)],
	"DOWN" : [Vector2(8,10)],
	"LEFT" : [Vector2(0,5)]
}

export (String) var room_name = "Base Room"
export (Array, String) var requirements = ["Start"]

func _ready() -> void:
	pass

func open_door(dir : String) -> void:
	for cell in DOORS.get(dir):
		$Layout.set_cellv(cell, 2)
