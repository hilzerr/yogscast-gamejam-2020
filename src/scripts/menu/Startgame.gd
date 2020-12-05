extends TextureRect

var mouse_wher = null
var mouse_over = null
var mouse_list = ['start', 'quit', 'settings']

func _ready():
	pass	

func _input(event):
	if event is InputEventMouseButton:
		if mouse_over == true:
			this_is_ya_mission(mouse_wher)


func this_is_ya_mission(where):
	if where == mouse_list[0]:
		pass
	elif where == mouse_list[1]:
		pass
	elif where == mouse_list[2]:
		pass


func _on_StartGame_focus_entered():
	mouse_wher = mouse_list[0]
	mouse_over = true


func _on_StartGame_focus_exited():
	mouse_wher = null
	mouse_over = false


func _on_Settings_focus_entered():
	mouse_wher = mouse_list[2]
	mouse_over = true
	

func _on_Settings_focus_exited():
	mouse_wher = null
	mouse_over = false


func _on_QuitGame_focus_entered():
	mouse_wher = mouse_list[1]
	mouse_over = true


func _on_QuitGame_focus_exited():
	mouse_wher = null
	mouse_over = false
