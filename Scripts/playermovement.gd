extends CharacterBody2D


@onready var sprite = $Sprite2D
@onready var death_anim = $AnimatedSprite2D
@onready var ui = get_tree().get_first_node_in_group("UI")

@export var jumping = false
var jumps = 0
var rotation_timer = 0
@export var SPEED = 300.0
@export var JUMP_VELOCITY = -700.0
var jump_sec = -60 * (JUMP_VELOCITY/ProjectSettings.get_setting("physics/2d/default_gravity"))
@export var direction = 1

@export var posy = 0

func deathanim():
	sprite.hide()
	set_physics_process(false)
	death_anim.get_child(0).play()
	death_anim.show()
	death_anim.play()
	

func _physics_process(delta: float) -> void:
	posy = position.y
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	# Handle jump.
	if Input.is_action_pressed("jump") and is_on_floor() and (!jumping or rotation_timer >= 35):
		velocity.y = JUMP_VELOCITY
		if !jumping or rotation_timer >= 35:
			jumps += 1
			ui.addjump(jumps)
		jumping = true
		sprite.texture = load("res://Sprites/Samuel_woke.png")
	if rotation_timer == jump_sec * 2:
		jumping = false
		sprite.texture = load("res://Sprites/Samuel.png")
		rotation_timer = 0
	if jumping:
		rotate(deg_to_rad(45/jump_sec))
		rotation_timer += 1 
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#Input.get_axis("ui_lef t", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_animated_death_animation_finished() -> void:
	Globals.deaths += 1
	get_tree().reload_current_scene()
