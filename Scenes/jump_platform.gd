extends Area2D

@export var jumpPadHeight = -900

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.velocity.y = jumpPadHeight
	pass # Replace with function body.
