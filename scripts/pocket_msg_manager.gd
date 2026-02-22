extends Node2D
class_name PocketMSGManager

const pocketMSGScene = preload("res://scenes/pocket_msg.tscn")

var maxMSG = 5
var heldMSG = 5

func _input(event: InputEvent) -> void:
	if (event.is_action_pressed("shootMSG") and heldMSG > 0): spawn_msg()

func reload_msg():
	if heldMSG < maxMSG: heldMSG += 1

func spawn_msg():
	var pocketMSGInstance = pocketMSGScene.instantiate()
	var pos = get_parent().global_position
	pocketMSGInstance.global_position = pos
	pocketMSGInstance.rotation = get_parent().dir_to_closest_enemy.angle()
	get_tree().root.add_child(pocketMSGInstance)
	heldMSG -= 1
