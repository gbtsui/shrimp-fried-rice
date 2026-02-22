extends Node

var kills: Dictionary

func add_kill(enemy_name: String):
	if (kills[enemy_name]) == null:
		kills[enemy_name] = 1
	else:
		kills[enemy_name] = kills[enemy_name] + 1
