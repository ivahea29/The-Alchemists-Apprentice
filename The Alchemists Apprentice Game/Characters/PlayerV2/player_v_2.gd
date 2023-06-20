extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var projectile: PackedScene
@onready var ActionableFinder: Area2D = $Direction/ActionableFinder
var animation_locked = false
var facing_right = true

func ready():
	pass

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		if animation_locked == false:
			$AnimatedSprite2D.play("woodcutter_jump")
	else:
		if(velocity.x == 0):
			if animation_locked == false:
				$AnimatedSprite2D.play("woodcutter_idle")
		else:
			if animation_locked == false:
				$AnimatedSprite2D.play("woodcutter_run")

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		if animation_locked == false:
			velocity.x = direction * SPEED
		if direction < 0:
			$AnimatedSprite2D.flip_h = true
			facing_right = false
		else:
			$AnimatedSprite2D.flip_h = false
			facing_right = true
	else:
		if animation_locked == false:
			velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if animation_locked == false:
		move_and_slide()
	else:
		velocity.x = 0
		var move_delta = velocity * delta
		move_and_collide(move_delta)
		
	if Input.is_action_just_pressed("attack_player_action"):
		$AnimatedSprite2D.play("woodcutter_throw")
		animation_locked = true
		shoot()
	
	#Play runFX when moving
	if is_on_floor() and velocity.x != 0:
		if !$runFX.playing:
			$runFX.play()
	else:
		$runFX.stop()
	

func shoot() -> void:
	var instance: Projectile = projectile.instantiate()
	owner.add_child(instance)
	instance.transform = $Marker2D.global_transform
	if facing_right == true:
		instance.direction = 1
	else:
		$Marker2D.position.x = -12
		instance.direction = -1

func _on_animated_sprite_2d_animation_finished():
	animation_locked = false

func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact"):
		var actionables = ActionableFinder.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			return

func _on_hurt_box_area_entered(area):
	if area.name == "enemyArea":
		GlobalScript._on_player_hit_enemy()
		animation_locked = true
		$AnimatedSprite2D.play("woodcutter_hurt")
		$hurtFX.play()
		
		if GlobalScript.playerHealth <= 0:
			queue_free()
			get_tree().reload_current_scene()
			GlobalScript.resetPlayerHealth()

