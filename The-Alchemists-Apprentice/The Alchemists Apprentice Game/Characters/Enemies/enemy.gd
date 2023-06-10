extends CharacterBody2D

const WALK_SPEED = 40
var speed = 40
var player_chase = false
var player = null
var direction = 1  # 1 for moving right, -1 for moving left
var gravity = Vector2(0, 800)  # Adjust the gravity value as needed

var health = 100
var player_inattack_zone = false

func _physics_process(delta):
	
	deal_with_damage()
	
	# Apply gravity - may be irrelevent **
	velocity.y += gravity.y * delta
	
	if player_chase:
		position += (player.position - position)/speed
		
		$AnimatedSprite2D.play("goblin_walk")
		
		if(player.position.x - position.x) < 0:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.play("goblin_idle")
	
	# Walk back and forth logic - may be irrelevent **
	speed = direction * WALK_SPEED
	velocity.x = speed
	
	move_and_slide()

	if is_on_wall():
		direction *= -1  # Reverse the direction when hitting a wall - may be irrelevent **
		
func _input(event: InputEvent) -> void:
	pass
		
func _on_detection_area_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		player = body
		player_chase = true

func _on_detection_area_body_exited(body: Node) -> void:
	if body == player:
		player = null
		player_chase = false

func _on_Area2D_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		player_chase = true

func _on_Area2D_body_exited(body: Node) -> void:
	if body.is_in_group("player"):
		player_chase = false

func _on_enemy_hitbox_body_entered(body):
	if body.has_method("player"):
		player_inattack_zone = true

func _on_enemy_hitbox_body_exited(body):
	if body.has_method("player"):
		player_inattack_zone = false
		
func deal_with_damage():
	if player_inattack_zone and global.player_current_attack == true:
		health = health -20
		print("Goblin health = ", health)
		if health <= 0:
			self.queue_free()
	
