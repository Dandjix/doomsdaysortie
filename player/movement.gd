extends RigidBody3D

@export var ACCELERATION = 100
@export var friction = 600
@export var CLIMB_SPEED = 1
@export var MAX_ALTITUDE = 20


func _get_input() -> Vector2:
	var input : Vector2 = Vector2.ZERO
	input.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input.y = int(Input.is_action_pressed("ui_down")) - int (Input.is_action_pressed("ui_up"))
	return input.normalized()

func _process(delta: float) -> void :
	var input = _get_input()*ACCELERATION
	linear_velocity = Vector3(linear_velocity.x+input.x*ACCELERATION,0,linear_velocity.z+input.y*ACCELERATION)


# Declare a reference to the Area3D hitbox
@export var hitbox: Area3D
@onready var hitbox_component: HitboxComponent = $HitboxComponent

# Called when the node enters the scene tree for the first time.
func _ready():
	# Connect signals to detect when an object enters or exits the hitbox
	hitbox_component.body_entered.connect(_on_body_entered)
	hitbox_component.body_exited.connect(_on_body_exited)
	gravity_scale = 0

# This function will be called when another body enters the hitbox
func _on_body_entered(body: Node):
	if body.is_in_group("enemies"):  # Example condition (e.g., enemies entering)
		print("Enemy entered the hitbox!")

# This function will be called when another body exits the hitbox
func _on_body_exited(body: Node):
	if body.is_in_group("enemies"):  # Example condition (e.g., enemies exiting)
		print("Enemy exited the hitbox!")
