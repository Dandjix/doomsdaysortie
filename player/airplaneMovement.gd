extends RigidBody3D

@export var ACCELERATION_TOP : float = 3
@export var ACCELERATION_DELTA : float = 0.5
@export var FRICTION : float = 30
## degrees per second
@export var TURN_SPEED : float = 0.3 
## a turn conversion of 1 means the plane can turn and its going at the same speed in the new direction, 0 means it continues in the direction it was
@export var TURN_EFFICIENCY : float = 0.5

var acceleration : float = 0

func _process_acceleration(delta:float) -> void :
	var delta_acceleration : float = int(Input.is_action_pressed("ui_up")) - int (Input.is_action_pressed("ui_down"))
	acceleration = clamp(acceleration + delta_acceleration*ACCELERATION_DELTA*delta,0,ACCELERATION_TOP) 
	
func _get_rotation_delta(delta:float) -> float:
	var delta_rotation : float = int(Input.is_action_pressed("ui_left")) - int (Input.is_action_pressed("ui_right"))
	return delta_rotation*TURN_SPEED*delta
	
func _physics_process(delta: float) -> void :
	var rotation : float = _get_rotation_delta(delta)

	rotate_y(rotation)

	_process_acceleration(delta)
	

	
	var lookDirection : Vector3 = -transform.basis.z.normalized()
	linear_velocity = lookDirection * acceleration
	
	print("linear_velocity : ",linear_velocity)

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
