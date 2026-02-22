extends Control

@onready var task_manager = $TasksManager

func _process(delta):
	$AspectRatioContainer/HBoxContainer/TextureProgressBar.value = get_node("../../../HealthManager").hp
	$AspectRatioContainer/HBoxContainer/MSGBar.value = get_node("../../../PocketMSGManager").heldMSG
		
	update_children_display(get_node("../../../SoySauceGuzzlingManager").heldSoySauce)
	


func update_children_display(count: int):
	var hbox = $HBoxContainer
	
	for i in range(hbox.get_child_count()):
		var child = hbox.get_child(i)
		child.visible = i < count
