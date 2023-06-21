extends CharacterBody2D

enum {
	WALK,
	HURT,
	ATTACK
}

var state = WALK
@onready var anim = $AnimatedSprite2D

var is_moving_left = true
var distance_traveled = 0
@export var max_distance = 100 #adjust to desired distance

const SPEED = 40.0
#const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var hurt_timer = 0
var hurt_duration = 1.0 #Adjust the duration as needed


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	match state:
		HURT:
			anim.animation = "hurt"
			hurt_timer += delta
			if hurt_timer >= hurt_duration:
				queue_free()
				GlobalScript.enemies_killed += 1
		WALK:
			anim.animation = "walk"
			if is_moving_left:
				velocity.x = -SPEED
			else:
				velocity.x = SPEED
			move_and_slide()
			update_distance(delta)
			check_distance_reached()
		ATTACK:
			anim.animation = "attack"
			velocity.x = 0
			
func update_distance(delta):
	distance_traveled += abs(velocity.x) * delta

func check_distance_reached():
	if distance_traveled >= max_distance:
		is_moving_left = !is_moving_left
		distance_traveled = 0
		scale.x = -scale.x


func _on_area_2d_body_entered(body):
	if body.name == "PlayerV2":
		if state != HURT:
			state = ATTACK
			$attackFX.play()
			GlobalScript._on_player_hit_enemy() #For double damage


func _on_area_2d_body_exited(body):
	if body.name == "PlayerV2":
		if state != HURT:
			state = WALK


func _on_area_2d_area_entered(area):
	if area.name == "Projectile":
		if state != HURT:
			$deathFX.play()
			$enemyArea.queue_free()
			$CollisionShape2D.queue_free()
			state = HURT
