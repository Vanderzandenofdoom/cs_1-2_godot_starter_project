extends CharacterBody2D
@onready var _animation_player: AnimatedSprite2D = $AnimatedSprite2D
var projectile_original = preload("res://scenes/projectile.tscn")

var xSpeed = 300.0
var xDirection = 0
var facing = "down"
var ySpeed = 300.0
var yDirection = 0
var coins = 0
@export var offset : Vector2 = Vector2(0, -25)
@onready var melee_hitbox: Area2D = $melee
@onready var collision_shape_2d: CollisionShape2D = $melee/CollisionShape2D


var maxHealth = 10
var health = maxHealth
var Is_attacking = false
var attack_timer = 0.6
var Current_enemy
var playerinrange = false
func _ready() -> void:
	pass

func _physics_process(_delta):
	
	xDirection = Input.get_axis("ui_left", "ui_right")
	
	yDirection = Input.get_axis("ui_up", "ui_down")
	
	velocity.x = xDirection * xSpeed
	velocity.y = yDirection * ySpeed
	
	if xDirection > 0:
		facing = "right"
		melee_hitbox.position = Vector2(30,0)
	elif xDirection < 0:
		facing = "left"
		melee_hitbox.position = Vector2(-30,0)
	elif yDirection < 0:
		facing = "up"
		melee_hitbox.position = Vector2(0,-40)
	elif yDirection > 0:
		facing = "down"
		melee_hitbox.position = Vector2(0,30)
		
	if Input.is_action_just_pressed("shoot"):
		shoot()
	if Input .is_action_just_pressed("melee"):
		Is_attacking = true
	if Is_attacking:
		attack_timer -= _delta
	if attack_timer < 0:
		Is_attacking = false
		attack_timer = 0.67
	
	update_animation()
	
	move_and_slide()

func update_animation():

	if Is_attacking:
		_animation_player.play("attack_" + facing)
	else:
		if velocity.is_zero_approx():
			_animation_player.play("idle_" + facing)
		elif !velocity.is_zero_approx():
			_animation_player.play("walk_" + facing)
	
func change_health(_amount:int):
		health += _amount
		if health < 1:
			die()
		if health > maxHealth:
			health = maxHealth
		print("Health: ", health)

func change_coins(_amount:int):
	coins += _amount
	print("you have " +str(coins) +" coins")

func die():
	print("you died")
	queue_free()

func shoot():

	var projectile_clone = projectile_original.instantiate()
	
	projectile_clone.global_position = position + offset
	
	projectile_clone.set_direction(facing)
	
	get_tree().get_root().add_child(projectile_clone)

func _process(delta: float):
	if Is_attacking and Current_enemy !=null:
		Current_enemy.queue_free()

func _on_melee_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		Current_enemy = body
	
func _on_melee_body_exited(body: Node2D) -> void:
	
	pass 
