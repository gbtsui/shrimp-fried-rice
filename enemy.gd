extends CharacterBody2D
class_name Enemy

var player: Player

const speed = 10.0

func _ready():
	player = get_tree().root.get_node("Root/Player")

func _physics_process(delta: float) -> void:
	if (player):
		var dir = (player.global_position - global_position)
		print(dir)
		velocity = speed * dir * delta
		move_and_slide()
