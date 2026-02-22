extends Node
class_name HealthManager

<<<<<<< HEAD
@export var hp = 10.0
@export var max_hp = 10.0
=======
@export var hp: float
@export var max_hp: float
>>>>>>> b06b4b35c128240f85faccddfc1e98c8507ffdc9

@onready var deathManager: DeathManager = get_parent().get_node("DeathManager")

func _ready():
	hp = max_hp

func damage(dmg_amount):
	hp -= dmg_amount
	get_parent().modulate_sprite(Color(1,0,0))
	await get_tree().create_timer(0.1).timeout
	get_parent().modulate_sprite(Color(1,1,1))
	print("damaged ", dmg_amount)
	if hp <= 0:
		deathManager.kys()
