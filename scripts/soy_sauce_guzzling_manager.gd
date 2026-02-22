extends Node
class_name SoySauceGuzzlingManager

var maxSoySauce = 3
var heldSoySauce = 3

var time_left_on_buff = 0.0
var buff_duration = 6.7 #in seconds

func _input(event: InputEvent) -> void:
	if (event.is_action_pressed("drinkSoySauce") and heldSoySauce > 0): drink()

func reload_msg():
	if heldSoySauce < maxSoySauce: heldSoySauce += 1

func _process(delta: float) -> void:
	if (time_left_on_buff > 0): 
		time_left_on_buff -= delta
		get_parent().speed = 300
		get_parent().knifeDamage = 4
	else:
		get_parent().speed = 200.0
		get_parent().knifeDamage = 2.5

func drink():
	var animationPlayer: AnimationPlayer = get_node("../AnimationPlayer")
	animationPlayer.play("drink")
	
	heldSoySauce -= 1
	time_left_on_buff = buff_duration
	
	#var pocketMSGInstance = pocketMSGScene.instantiate()
	#var pos = get_parent().global_position
	#pocketMSGInstance.global_position = pos
	#pocketMSGInstance.rotation = get_parent().dir_to_closest_enemy.angle()
	#get_tree().root.add_child(pocketMSGInstance)
	pass
