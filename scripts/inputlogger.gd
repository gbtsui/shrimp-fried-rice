extends Node


func _input(event: InputEvent) -> void:
	if (event.is_action_released("down")): print("down")
# exists for debug !!!


func _on_range_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
