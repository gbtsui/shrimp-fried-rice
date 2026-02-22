extends CanvasLayer

func flashy_go_brr():
	$CanvasLayer/Control.visible = true
	
	#need to convert sprite global pos to local pos in canvaslayer
	#sprite.texture = $Sprite2D.texture
	$Sprite2D.modulate = Color(0,0,0)
	#$Sprite2D.position = get_viewport().get_rect().position - sprite.global_position
	
	# play more fun animations here
	get_parent().get_node("AnimationPlayer").play("death")
	
	await get_tree().create_timer(1).timeout
	
	$Sprite2D.visible = false
	$GPUParticles2D.global_position = $Sprite2D.global_position
	$GPUParticles2D.emitting = true
	
	var tween = get_tree().create_tween()
	tween.tween_property($CanvasLayer/Control/Label, "modulate", Color(1,1,1,0.9), 3) 
	
	await get_tree().create_timer(3).timeout
	
	get_tree().change_scene_to_file("res://startscreen.tscn")

func _process(delta):
	$Sprite2D.global_position = get_parent().global_position
