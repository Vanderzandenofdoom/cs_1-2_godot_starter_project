extends CharacterBody2D
@onready var _animation_player: AnimatedSprite2D = $AnimatedSprite2D

var xSpeed = 300.0
var xDirection = 0
var facing = "down"
var ySpeed = 300.0
var yDirection = 0

# TODO: Add health system variables
var health = 10
var maxHealth = 10
var coins = 0
# TODO: Add projectile scene for shooting
var projectile_scene = preload("res://scenes/projectile.tscn")


func _physics_process(_delta):
	
	xDirection = Input.get_axis("ui_left","ui_right")
	# TODO: Print the direction to see what number we get
	# This will help us understand what's happening
	# ("X Direction: ", xDirection)
	velocity.x = xSpeed * xDirection
	
	# TODO: Get vertical input (up/down keys)  
	# Same idea, but for up and down movement
	yDirection = Input.get_axis("ui_up", "ui_down")
	
	
	# TODO: Print the Y direction too
	# Type this exactly: print("Y Direction: ", yDirection)
	
	
	velocity.y = ySpeed * yDirection
	# TODO: Calculate X movement by multiplying direction × speed
	# This gives us the actual pixels to move this frame
	# If direction is 1 and speed is 300, we get 300 pixels right
	# If direction is -1 and speed is 300, we get -300 pixels (left)
	# Type this exactly: var velocity.y = xDirection * xSpeed
	
	# TODO: Calculate Y movement the same way
	# Type this exactly: var velocity.y = yDirection * ySpeed  
	
	# TODO: Set the Y velocity too
	# Type this exactly: velocity.y = yVector
	move_and_slide()
	
	# TODO: Update facing direction based on movement
	# Use if statements to check xDirection and yDirection
	# Set facing to "right", "left", "down", or "up"
	# Only update facing when actually moving (direction != 0)
	
	
	if xDirection > 0:
		facing="right"
	elif xDirection < 0:
		facing="left"
	if yDirection < 0:
		facing="up"
	elif yDirection > 0:
		facing="down"
	
	# TODO: Check for shooting input
	# Use: if Input.is_action_just_pressed("ui_accept"):
	# Then call your shoot() function
	if Input.is_action_just_pressed("ui_select"):
		shoot()
		
	update_animation()
	# TODO: Actually apply the movement
	# This is a special Godot function that makes the movement happen
	# ove_and_slide()Type this exactly: move_and_slide()
	
	
	# TODO: Print confirmation that we moved
	# Type this exactly: print("Player moved!")


# TODO: Create animation function (add this outside of _physics_process)
func update_animation():
	# TODO: Set the animation based on the facing direction
	# Use: _animation_player.play("idle_" + facing)
	# This combines "idle_" with whatever direction we're facing
	if xDirection ==0 && yDirection ==0 :_animation_player.play("idle_"+facing)
	elif xDirection != 0 || yDirection !=0 : _animation_player.play("walk_"+facing)
	pass

# TODO: Create health change function for interactions
func change_health(amount):
	# TODO: Add amount to health (positive = heal, negative = damage)
	# TODO: Make sure health stays between 0 and maxHealth
	# TODO: Print the new health value
	# TODO: Check if health <= 0 for death (optional challenge)
	print("Health changed by: ", amount)


# TODO: Create shooting function
func shoot():
	
	var new_instance = projectile_scene.instantiate()
	new_instance.set_direction(facing)
	get_parent().add_child(new_instance)
	new_instance.global_position = position - Vector2(0,25)
	
	pass
		# TODO: Create a new projectile instance
	# Look at the documentation examples in the lesson

	# TODO: Set projectile position to player position
	# Look at the "Setting Object Position" example
	
	
	# TODO: Set projectile direction using facing variable
	# Look at the "Calling Functions on Other Objects" example
	
	
	# TODO: Add projectile to the game world
	# Look at the "Adding Objects to the Game World" example
	
	
	# TODO: Print shooting confirmation
	# print("Shot projectile facing: ", facing)
func change_coins(amount:int):
	prints("you have "+str(coins)+" coins")
	coins+=1
	
func changehealth(amount:int):
	prints("you have"+str(health)+"health")
	health+=amount 
	if health < 0:
		health=0
	if health>maxHealth:
		health=maxHealth
	if health < 1:
		queue_free()
	
