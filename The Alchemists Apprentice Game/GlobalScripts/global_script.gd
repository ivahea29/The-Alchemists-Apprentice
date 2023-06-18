extends Node

var num_scrolls = 0
var num_gems = 0

var playerHealth = 100
func resetPlayerHealth():
	playerHealth = 100
	
func _on_player_hit_enemy():
	playerHealth -= 10
	if playerHealth <= 0:
		print("Player Dead")
	else:
		print("Player Health: ", playerHealth)
	
