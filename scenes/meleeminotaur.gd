extends Node

var in_range
var chasing
var attacking
@onready var player: CharacterBody2D = %Player

func _process(delta: float) -> void:
	pass



func _on_melee_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_melee_body_exited(body: Node2D) -> void:
	pass # Replace with function body.



func _on_shoot_body_entered(body: Node2D) -> void:
	pass # Replace with function body.



func _on_shoot_body_exited(body: Node2D) -> void:
	pass # Replace with function body.




func _on_chase_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_chase_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
