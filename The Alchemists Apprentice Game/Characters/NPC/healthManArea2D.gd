extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event.is_action_pressed("interact"):
		print("Overlapping Healthman bods: ", get_overlapping_bodies().size())
		if get_overlapping_bodies().size() > 1:
			if GlobalScript.num_gems >= 5:
				GlobalScript.resetPlayerHealth()
				GlobalScript.num_gems -= 5
				$HealthMan/healthSound.play()
