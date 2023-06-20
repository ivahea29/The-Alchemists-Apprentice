extends Node

var num_scrolls = 0
var num_gems = 0

var playerHealth = 9
var maxPlayerHealth = 9

var num_deaths = 0
var enemies_killed = 0

func resetPlayerHealth():
	playerHealth = 9

func _on_player_hit_enemy():
	playerHealth -= 1
	if playerHealth <= 0:
		num_deaths += 1
		print("Player Dead")
	else:
		print("Player Health: ", playerHealth)
		
