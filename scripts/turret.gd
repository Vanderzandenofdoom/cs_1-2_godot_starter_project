extends CharacterBody2D
var projectile_original = preload("res://scenes/enemy_projectile.tscn")
var Player
var timerstart = 2
var timer = timerstart
var inrange = false
func _ready():
	
	pass

func _process(delta: float) -> void:
	if inrange:
		timer-=delta
		if timer < 0:
			shoot(Player.position)
	pass
	
	
	
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	Player = body
	if body == Player:
	var projectile_clone = projectile_original.instantiate()
	
	# TODO: Set projectile position to player position
	projectile_clone.global_position = position
	
	# TODO: Set projectile direction using facing variable
	projectile_clone.set_direction(Player.position)
	
	# TODO: Add projectile to the game world
	get_tree().get_root().add_child(projectile_clone)
	pass # Replace with function body.
# TODO: Create a new projectile instance


func _on_area_2d_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
