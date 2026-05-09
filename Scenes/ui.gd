extends Control

@onready var jumps = $Jumps
@onready var deaths = $Deaths
func addjump(num: int):
	jumps.text = "JUMPS: " + str(num)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	deaths.text = "DEATHS: " + str(Globals.deaths)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
