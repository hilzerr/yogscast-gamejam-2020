extends MarginContainer

#var settings_scene = preload("res://path/to/scene.tscn").instance()
#var starting_scene = preload("res://path/to/scene.tscn").instance()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Settings_up():
	#get_tree().change_scene("res://path/to/scene.tscn")	
	pass


func _on_QuitGame_up():
	get_tree().quit()

 
func _on_StartGame_up():
	#get_tree().change_scene("res://path/to/scene.tscn")
	pass
