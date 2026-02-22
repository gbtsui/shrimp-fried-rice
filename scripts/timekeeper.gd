extends Node
class_name Timekeeper

#I AM THE MASTER OF THE CLOCK.

@export var starting_time = 120
var time_left
var infinite_mode: bool = true

func _ready():
	if !infinite_mode: time_left = starting_time

func _process(delta: float) -> void:
	if !infinite_mode:
		time_left -= delta
		if time_left <= 0:
			get_tree().root.get_node("Root/GameStateManager")
