extends Node2D

var start_color = ProjectSettings.get_setting("rendering/environment/defaults/default_clear_color")
@export var end_color = Color.WEB_PURPLE
var inbetween_color

@onready var player = $CharacterBody2D

func _process(delta: float) -> void:
	inbetween_color = start_color.lerp(end_color, -player.posy/10000)
	RenderingServer.set_default_clear_color(inbetween_color)
