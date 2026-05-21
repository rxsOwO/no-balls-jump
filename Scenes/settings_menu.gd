extends Control

@onready var volume = $VBoxContainer/HBoxContainer/Volume

func _ready() -> void:
	volume.value = db_to_linear(AudioServer.get_bus_volume_db(0))


func _on_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0,linear_to_db(value))
	pass
