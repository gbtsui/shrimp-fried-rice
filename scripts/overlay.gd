extends Control

func _process(delta):
	$TextureProgressBar.value = get_node("../../../HealthManager").hp
	$MSGBar.value = get_node("../../../PocketMSGManager").heldMSG
