extends CharacterBody2D

## attack, health, player alive
var enemy_in_attack_range = false  # Flag indicating if an enemy is within attack range
var enemy_attack_cooldown = true  # Flag indicating if the player is in cooldown after an attack
var health = 100  # Player's health value
var player_alive = true  # Flag indicating if the player is alive

@export var speed = 250  # Player's movement speed
@export var gravity = 30  # Gravity applied to the player
@export var jump = -500  # Jump velocity
var current_dir = "none"  # Current direction of the player
var motion = Vector2.ZERO  # Motion vector of the player
var isJumping = false  # Flag indicating if the player is jumping

var attack_ip = false  # Flag indicating if an attack input is in progress
var global_script  # Global script reference

# Camera properties
var camera: Camera2D  # Reference to the Camera2D node
var camera_offset = Vector2(0, -50)  # Offset to adjust camera position relative to the character

func _ready():
	pass

func _physics_process(delta): 
	player_movement(delta)
	
	# Update camera position to follow the character
	var position2D = get_node("NodePath/Position2D")  # Replace "NodePath" with the actual path to the Position2D node
	if position2D != null:
		get_parent().global_position = position2D.global_position
	
	## player health
	if health <= 0:
		player_alive = false
		health = 0
		print("Player has been killed")
		## add in here what happens next

func player_movement(_delta):    
	if !is_on_floor():
		velocity.y += gravity  # Apply gravity to the player's vertical velocity
		if velocity.y > 1000:  # Limit the maximum falling speed
			velocity.y = 1000

	if Input.is_action_just_pressed("jump"):
		$AnimatedSprite2D.play("woodcutter_jump")  # Play the jump animation
		velocity.y = jump  # Set the player's vertical velocity to the jump velocity
		velocity.x = 0  # Reset horizontal velocity when jumping

	var horizontal_direction = Input.get_axis("left", "right")
	
	if horizontal_direction == 0:
		if is_on_floor() and !Input.is_action_pressed("attack"):
			if isJumping:
				$player_jump_player.play("jump+player")  # Play the jump animation if the player was jumping
			else:
				$AnimatedSprite2D.play("woodcutter_idle")  # Play the idle animation when on the floor and not attacking
		velocity.x = 0  # Reset horizontal velocity when not moving
	else:
		$AnimatedSprite2D.play("woodcutter_walk")  # Play the walk animation
		velocity.x = speed * horizontal_direction  # Set the horizontal velocity based on the input direction	
		$AnimatedSprite2D.flip_h = velocity.x < 0  # Flip the sprite horizontally based on the movement direction
		
	if Input.is_action_just_pressed("attack_player_action"):
		if !$attack_player.is_playing():  # Check if the attack animation is not already playing
			attack_ip = true  # Set the attack input flag to true
			$attack_player.play("attack")  # Play the attack animation
			
	if attack_ip and !$attack_player.is_playing():  # Check if the attack animation has finished
		attack_ip = false  # Set the attack input flag to false
		$AnimatedSprite2D.play("woodcutter_idle")  # Play the idle animation
		
	move_and_slide()  # Move and slide the player based on the calculated velocity
