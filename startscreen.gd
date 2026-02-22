extends Control

func _ready():
	$AnimationPlayer.play("aga")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("coin"):
		get_tree().change_scene_to_file("res://VN.tscn")
