extends Node2D

const room_path : String = "res://scenes/world/rooms/"

var rooms = {
	"Spawn" : { "scene": preload("res://scenes/world/rooms/TestRoom.tscn"), "requirements": []}
}

export (Vector2) var tile_size = Vector2(32, 32)
export (Vector2) var room_size = Vector2(18, 11)

var level := Dictionary()

func _ready() -> void:
	get_rooms()
	generate_level()
	var player = preload("res://scenes/player/Player.tscn").instance()
	player.position = Vector2()
	add_child(player)

func generate_level() -> void:
	var new_room : Room = rooms.Spawn.scene.instance()
	var room_pos := Vector2(0,0)
	place_room(new_room, room_pos)

func place_room(room : Room, pos : Vector2) -> void:
	level[pos] = room
	room.position = pos * room_size * tile_size
	room.connect("body_entered", self, "_on_room_entered", [room])
	add_child(room)

func _on_room_entered(_body : Player, room : Room) -> void:
	$Camera2D.position = room.position

func get_rooms() -> void:
	var room_dir := Directory.new()
	if room_dir.open(room_path) == OK:
		room_dir.list_dir_begin(true)
		var file_name := room_dir.get_next()
		while file_name != "":
			var room : Room = load(room_path + file_name).instance()
			rooms[room.room_name] = {
				"scene" : load(room_path + file_name),
				"requirements" : room.requirements}
			file_name = room_dir.get_next()
	#print_debug(rooms)
