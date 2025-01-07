extends Node3D
class_name WorldShiftPlayer

func _enter_tree() -> void:
	if WorldShiftManagerSingleton._player != null :
		push_error("there are more than one world shift player !")
	WorldShiftManagerSingleton._player = self
	
func _exit_tree() -> void:
	if WorldShiftManagerSingleton._player != self :
		push_error("non active world shift player exited tree !")
	WorldShiftManagerSingleton._player = null
