extends Area2D

func _ready():
	$GPUParticles2D.emitting = true

func _on_gpu_particles_2d_finished() -> void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body is Enemy:
		body.get_node("HealthManager").damage(10)
