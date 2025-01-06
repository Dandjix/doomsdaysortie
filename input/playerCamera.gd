extends Camera3D


# Called when the node enters the scene tree for the first time.

var relativePosition : Vector3

func _ready() -> void:
	relativePosition = position - basic_bomber.position

@onready var basic_bomber: RigidBody3D = $"../BasicBomber"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = basic_bomber.position + relativePosition
