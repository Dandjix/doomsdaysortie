@tool
extends EditorPlugin

var panel 
const TOOL_PANEL = preload("res://addons/terraineditorplugin/TerrainEditorPanel.tscn")

# Called to add custom UI to the editor
func _enter_tree() -> void: 
	panel= TOOL_PANEL.instantiate()
	panel.undo_redo = get_undo_redo()
	
	add_control_to_dock(EditorPlugin.DOCK_SLOT_LEFT_BL,panel)
	
func _exit_tree() -> void:
	remove_control_from_docks(panel)
	
	panel.queue_free()

func generateLol() ->void:
	print("generating lmao")
	
