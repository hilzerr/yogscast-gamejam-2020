extends Node2D

const rooms = {
	"ROOM" : preload("res://scenes/world/Room.tscn")
}

export (Vector2) var tile_size = Vector2(32, 32)
export (Vector2) var room_size = Vector2(18, 11)

var level := Dictionary()

func _ready() -> void:
	generate_level()
	var player = preload("res://scenes/player/Player.tscn").instance()
	player.position = Vector2()
	add_child(player)

func generate_level() -> void:
	var new_room : Area2D = rooms.ROOM.instance()
	var room_pos := Vector2(.6,0)
	level[room_pos] = new_room
	new_room.position = room_pos * room_size * tile_size
	new_room.connect("body_entered", self, "_on_room_entered", [new_room])
	add_child(new_room)

func _on_room_entered(_body : Player, room : Room) -> void:
	$Camera2D.position = room.position
