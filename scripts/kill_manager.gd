extends Node
<<<<<<< HEAD

var kills: Dictionary

func add_kill(enemy_name: String):
	if (kills[enemy_name]) == null:
		kills[enemy_name] = 1
	else:
		kills[enemy_name] = kills[enemy_name] + 1
=======
class_name KillManager

var kills: Dictionary = {}

func kill_off_enemy(enemy: Enemy):
	var enemy_name = enemy.enemyName
	currently_alive_enemies.remove_at(currently_alive_enemies.find(enemy))
	if !kills.has(enemy_name):
		kills[enemy_name] = 1
	else:
		kills[enemy_name]= kills[enemy_name] + 1

var currently_alive_enemies: Array[Enemy] = []

func add_currently_alive_enemy(enemy: Enemy):
	currently_alive_enemies.append(enemy)
>>>>>>> b06b4b35c128240f85faccddfc1e98c8507ffdc9
