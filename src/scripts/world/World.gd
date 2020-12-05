extends Node2D

const rooms = {
	"ROOM" : preload("res://scenes/world/Room.tscn")
}

export (Vector2) var room_size = Vector2(18, 11)

var level := Dictionary()

func _ready() -> void:
	generate_level()
	var player := Player.new()
	player.position = Vector2()
	add_child(player)

func generate_level() -> void:
	var new_room : Area2D = rooms.ROOM.instance()
	var room_pos := Vector2(0,0)
	level[room_pos] = new_room
	new_room.position = room_pos * room_size
	add_child(new_room)
