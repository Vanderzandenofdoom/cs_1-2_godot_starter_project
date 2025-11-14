extends CharacterBody2D

var in_range = false
var chasing = false
var attacking = false 
var health = 3
var speed = 200
var startime = 1
var timer = startime
var xDirection = 0
var yDirection = 0
var facing = "down"
@onready var player: CharacterBody2D = %Player
var projectile_original = preload("res://scenes/enemy_arrow.tscn")
@onready var _animation_player: AnimatedSprite2D = $AnimatedSprite2D

func _process(delta: float) -> void:
	if in_range:
		if timer < 0:
			shoot()
			timer = startime
		timer -= delta
	elif chasing:
		position += position.direction_to(player.position) * speed*delta
	if attacking:
		if timer < 0:
			player.change_health(-2)
			timer = startime
		timer -= delta
			
		if xDirection > 0:
			facing = "right"
		elif xDirection < 0:
			facing = "left"
		elif yDirection < 0:
			facing = "up"
		elif yDirection > 0:
			facing = "down"
		update_animation()
func update_animation():

	if attacking:
		_animation_player.play("attack_" + facing)
	else:
		if !in_range and !chasing:
			_animation_player.play("crossbow_idle_" + facing)
		elif chasing and !attacking:
			_animation_player.play("walk_" + facing)


func _on_shoot_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player = body
		in_range = true
		print("shooting")
	 # Replace with function body.


func _on_shoot_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player = body
		in_range = false
	 # Replace with function body.


func _on_chase_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player = body
		chasing = true
		in_range = false
		print("chasing")
	 # Replace with function body.


func _on_chase_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player = body
		in_range = true
		chasing = false
		print("shooting")
	# Replace with function body.
	
func _on_melee_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player = body
		chasing = true
		attacking = true
		print("chasing")
		print("attacking")
	 # Replace with function body.


func _on_melee_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player = body
		chasing = true
		attacking = false
		print("chasing")
	# Replace with function body.


func shoot():
	var projectile_clone = projectile_original.instantiate()
	projectile_clone.global_position = position
	projectile_clone.set_direction(player.position)
	get_tree().get_root().add_child(projectile_clone)
	
