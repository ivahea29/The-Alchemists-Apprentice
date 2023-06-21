extends Node2D

func ready():
	pass
		


func _on_boss_scene_area_2d_body_entered(body):
	if body.name == "PlayerV2":
		$Level4Music.stop()
		$endLevelSound/bossFightSpeech.play()
		$endLevelSound/bossFightMusic.play()


func _on_boss_scene_area_2d_body_exited(body):
	if body.name == "PlayerV2":
		$endLevelSound/bossFightMusic.stop()
		$Level4Music.play()
