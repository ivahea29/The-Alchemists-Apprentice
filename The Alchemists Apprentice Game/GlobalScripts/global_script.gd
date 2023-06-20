extends Node

var num_scrolls = 0
var num_gems = 0

var playerHealth = 9
var maxPlayerHealth = 9

func resetPlayerHealth():
	playerHealth = 9

func _on_player_hit_enemy():
	playerHealth -= 1
	if playerHealth <= 0:
		print("Player Dead")
	else:
		print("Player Health: ", playerHealth)
		
