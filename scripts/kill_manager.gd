extends Node
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
