extends Area2D
var Active = false
@onready var _animation_player: AnimatedSprite2D = $AnimatedSprite2D
func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		Active = true
		print("lever 4 active")
		update_animation()
		
func update_animation():
	if Active:
		_animation_player.play("on")
	else:
		_animation_player.play("off")
