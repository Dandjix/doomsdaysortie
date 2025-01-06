@tool
extends VBoxContainer

var undo_redo : EditorUndoRedoManager

func _on_destroy_pressed() -> void:
	#undo_redo.create_action("Terrain manager : Generate terrain") #undo redo is going to be annoying.
	for terrain in _get_all_selected_terrain():
		terrain.destroy_terrain()

func _on_create_pressed() -> void:
	for terrain in _get_all_selected_terrain():
		terrain.generate_terrain()

func _get_all_selected_terrain() :
	var selection = EditorInterface.get_selection()
	var terrain_nodes = []

	for node in selection.get_selected_nodes() :
		if node is Terrain:
			terrain_nodes.append(node as Terrain)
	return terrain_nodes
	
