extends Area2D

class_name Projectile


var speed: float = 500
var direction = 1
var velocity: Vector2 = Vector2()
const GRAVITY = 200

func _physics_process(delta: float):
	velocity.y += GRAVITY * delta
	velocity.x = direction * speed
	position += velocity * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
