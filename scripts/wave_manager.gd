extends Node
class_name WaveManager

const enemies: Dictionary = {
	"pea": preload("res://scenes/pea.tscn")
}

@export var enemyLimit = 5

@onready var spawnpoints = get_tree().root.get_node("Root").find_children("SpawnPoint*")
@onready var killman: KillManager = get_tree().root.get_node("Root/KillManager")

func spawn_enemy(enemyType: String):
	var instance = enemies[enemyType].instantiate()
	
	var spawnpoint = spawnpoints.pick_random()
	instance.global_position = spawnpoint.global_position
	
	killman.add_currently_alive_enemy(instance)
	get_tree().root.get_node("Root").add_child(instance)

func _process(delta: float) -> void:
	if killman.currently_alive_enemies.size() < enemyLimit and randf() < 0.04:
		spawn_enemy(enemies.keys().pick_random())
