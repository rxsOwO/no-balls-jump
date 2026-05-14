extends Control

func resume():
	hide()
	get_tree().paused = false
func pause():
	show()
	get_tree().paused = true

func _process(delta: float) -> void:
		if Input.is_action_just_pressed("esc") and !get_tree().paused:
			pause()
		elif Input.is_action_just_pressed("esc") and get_tree().paused:
			resume()

func _on_resume_pressed() -> void:
	resume()
func _on_restart_pressed() -> void:
	Globals.deaths += 1
	resume()
	get_tree().reload_current_scene()
