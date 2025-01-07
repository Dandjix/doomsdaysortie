extends Node
class_name WorldShiftAgent

func _enter_tree() -> void:
	WorldShiftManagerSingleton._addAgent(self)

func _exit_tree() -> void:
	WorldShiftManagerSingleton._removeAgent(self)

func _offset(x : float, y : float) -> void:
	var parent = get_parent()
	parent.global_position = Vector3(
		parent.global_position.x+x,
		parent.global_position.y,
		parent.global_position.z+y
		)
