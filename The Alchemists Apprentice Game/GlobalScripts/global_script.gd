extends Node

signal player_hurt

var num_scrolls = 0
var num_gems = 0

var playerHealth = 100

func resetPlayerHealth():
	playerHealth = 100
	
func _on_player_hit_enemy():
	playerHealth -= 10
	if playerHealth <= 0:
		print("PLAYER DEAD")
	else:
		print("Player health:", playerHealth)
