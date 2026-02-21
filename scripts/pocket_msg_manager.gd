extends Node2D
class_name PocketMSGManager

const pocketMSGScene = preload("res://scenes/pocket_msg.tscn")

func _input(event: InputEvent) -> void:
	if (event.is_action_pressed("shootMSG")): spawn_msg()

func spawn_msg():
	var pocketMSGInstance = pocketMSGScene.instantiate()
	var pos = get_parent().global_position
	pocketMSGInstance.global_position = pos
	
	get_tree().root.add_child(pocketMSGInstance)
