extends Node
class_name HealthManager

@export var hp = 10
@export var max_hp = 10

@onready var deathManager: DeathManager = get_parent().get_node("DeathManager")

func damage(dmg_amount):
	hp -= dmg_amount
	get_parent().modulate_sprite(Color(1,0,0))
	await get_tree().create_timer(0.1).timeout
	get_parent().modulate_sprite(Color(1,1,1))
	if hp <= 0:
		deathManager.kys()
