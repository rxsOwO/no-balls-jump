extends StaticBody2D

func instakill(body: Node2D):	
	if body.is_in_group("player"):
		print("dead")
		body.deathanim()

func kill(body: Node2D):
	if body.is_in_group("player"):
		if body.jumping:
			instakill(body)
		
func _on_area_2d_left_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.direction = 1
		self.call_deferred("kill", body)
	pass # Replace with function body.


func _on_area_2d_right_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.direction = -1
		self.call_deferred("kill", body)
	pass # Replace with function body.

func _on_platformarea_body_entered(body: Node2D) -> void:
	self.call_deferred("kill", body)
	pass
func _on_spike_body_entered(body: Node2D) -> void:
	self.call_deferred("instakill", body)
	pass # Replace with function body.

func _on_wallarea_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if body.direction == 1:
			body.direction = -1
		elif body.direction >= -1:
			body.direction = 1
		self.call_deferred("kill", body)
	pass # Replace with function body.


func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
