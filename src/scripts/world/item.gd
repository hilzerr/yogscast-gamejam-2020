extends Node2D

export (Resource) var item_data

func _ready() -> void:
	$Sprite.texture = (item_data as Item).texture


func _on_AnimationPlayer_ready():
	if $Sprite.hframes == 3 and item_data == load("res://resources/WaterJug.tres"):
		$Sprite/AnimationPlayer.play("idle")
	
