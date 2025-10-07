extends CharacterBody2D
var projectile_original = preload("res://scenes/enemy_projectile.tscn")
var player
var timerstart = 2
var timer = timerstart
var inrange = false

func _ready():
	
	pass

func shoot(body):
	var projectile_clone = projectile_original.instantiate()
	projectile_clone.global_position = position + offset
	projectile_clone.set_direction(facing)
	get_tree().get_root().add_child(projectile_clone)


func _process(delta: float) -> void:
	if inrange:
		timer-=delta
		if timer < 0:
			shoot(player)
	pass
	
func shoot(body):
	if body.name == "Player":
		var projectile_clone = projectile_original.instantiate()
		projectile_clone.global_position = position
		projectile_clone.set_direction(body.position)
		get_tree().get_root().add_child(projectile_clone)
	
	
func _on_area_2d_body_entered(body: Node2D) -> void:
<<<<<<< HEAD
	Player = body
	if body == body.Player:
		var projectile_clone = projectile_original.instantiate()
	
	# TODO: Set projectile position to player position
		projectile_clone.global_position = position
	
	# TODO: Set projectile direction using facing variable
		projectile_clone.set_direction(Player.position)
	
	# TODO: Add projectile to the game world
		get_tree().get_root().add_child(projectile_clone)
	pass # Replace with function body.
# TODO: Create a new projectile instance
=======
	player = body
	if body.name == "Player":
		inrange = true
>>>>>>> 9e0ddde690b21d7f9f527b6e0b5ff0b68b086e38


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		inrange == false
	
	pass
