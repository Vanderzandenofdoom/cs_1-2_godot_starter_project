extends CharacterBody2D

var in_range = false
var chasing = false
var attacking = false 
var health = 3
var speed = 200
@onready var player: CharacterBody2D = %Player
var projectile_original = preload("res://scenes/enemy_arrow.tscn")

func _process(_delta: float) -> void:
	if in_range:
		shoot()
		pass


func _on_melee_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player = body
	in_range = false
	chasing = true
	attacking = true
	pass # Replace with function body.


func _on_melee_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player = body
	in_range = false
	chasing = true
	attacking = false
	pass # Replace with function body.


func _on_shoot_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player = body
	in_range = true
	chasing = false
	attacking = false
	pass # Replace with function body.


func _on_shoot_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player = body
	in_range = false
	chasing = false
	attacking = false
	pass # Replace with function body.


func _on_chase_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player = body
	chasing = true
	in_range = false
	attacking = false
	pass # Replace with function body.


func _on_chase_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player = body
	in_range = true
	chasing = false
	attacking = false
	pass # Replace with function body.

func shoot():
	var projectile_clone = projectile_original.instantiate()
	projectile_clone.global_position = position
	projectile_clone.set_direction(player.position)
	get_tree().get_root().add_child(projectile_clone)
	
