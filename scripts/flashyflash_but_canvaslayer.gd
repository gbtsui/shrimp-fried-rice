extends CanvasLayer

func flashy_go_brr():
	$CanvasLayer/Control.visible = true
	
	#need to convert sprite global pos to local pos in canvaslayer
	#sprite.texture = $Sprite2D.texture
	$Sprite2D.modulate = Color(0,0,0)
	#$Sprite2D.position = get_viewport().get_rect().position - sprite.global_position
	
	# play more fun animations here
	
	
