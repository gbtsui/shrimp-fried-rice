extends Node
class_name DeathManager

enum DEATH_MODE {
	PLAYER,
	ENEMY
}

var mode: DEATH_MODE
@onready var parent = get_parent()

func _ready() -> void:
	if parent is Enemy:
		mode = DEATH_MODE.ENEMY
	elif parent is Player:
		mode = DEATH_MODE.PLAYER

func kys():
	if mode == DEATH_MODE.PLAYER:
		parent.get_node("PlayerStateManager").change_state(1)
		parent.get_node("PhysicalCollision").disabled = true
		parent.modulate = Color(0,0,0)
		parent.get_node("CanvasLayer").flashy_go_brr()
	elif mode == DEATH_MODE.ENEMY:
		get_tree().root.get_node("Root/KillManager").kill_off_enemy(parent)
		parent.queue_free() #add more later i guess??
