extends Control

@onready var mainmenu = $Menu
@onready var settingsmenu = $SettingsMenu

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("esc"):
		mainmenu.show()
		settingsmenu.hide()
	pass


func _on_play_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/level.tscn")
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_settings_pressed() -> void:
	mainmenu.hide()
	settingsmenu.show()

func _on_menu_pressed() -> void:
	mainmenu.show()
	settingsmenu.hide()
