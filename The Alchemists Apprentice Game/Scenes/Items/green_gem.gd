extends Node2D

signal gem_collected

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.name == "PlayerV2":
		$pickupFX.play()
		emit_signal("gem_collected")
		GlobalScript.num_gems += 1
		print_debug(GlobalScript.num_gems)
		$Sprite2D.visible = false
		$Area2D.queue_free()
		$Timer.wait_time = $pickupFX.stream.get_length()
		$Timer.start()
		set_process(true)


func _on_timer_timeout():
	queue_free()
