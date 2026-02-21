extends Area2D
class_name Hurtbox

@export var dmg = 5.0

func _on_body_entered(body: Node2D) -> void:
	var bodyHpman: HealthManager = body.get_node("HealthManager")
	if bodyHpman:
		bodyHpman.damage(dmg)
