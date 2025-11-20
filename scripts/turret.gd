extends CharacterBody2D
var projectile_original = preload("res://scenes/enemy_projectile.tscn")
var player
var timerstart = 2
var timer = timerstart
var inrange = false

func _ready():
	pass

func _process(delta: float) -> void:
	if inrange:
		timer-=delta
		if timer < 0:
			shoot(player)
			timer=timerstart
		timer -= delta
	
	pass
	
func shoot(body):
	if body.name == "Player":
		var projectile_clone = projectile_original.instantiate()
		projectile_clone.global_position = position
		projectile_clone.set_direction(body.position)
		get_tree().get_root().add_child(projectile_clone)
	
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	pass

	player = body
	if body.name == "Player":
		inrange = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		inrange = false
	
	pass
