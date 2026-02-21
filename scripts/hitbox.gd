extends Area2D
class_name Hitbox

@onready var hpman = get_parent().get_node("HealthManager")

#only listens for damage.
func damage(dmg_amount):
	hpman.damage(dmg_amount)

#slightly redundant...? je ne sais pas twin
#NOUS ecrivons du code en spaghetti
