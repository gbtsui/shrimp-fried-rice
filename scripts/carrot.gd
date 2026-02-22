extends Enemy

func _physics_process(delta: float) -> void:
	super(delta)
	if(player): look_at(player.global_position)
