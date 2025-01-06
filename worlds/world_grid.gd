extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	mesh=create_grid_mesh(100,10)

func create_grid_mesh(grid_size: int, cell_size: float) -> Mesh:
	var mesh = ImmediateMesh.new()
	mesh.surface_begin(Mesh.PRIMITIVE_LINES)

	# Draw lines parallel to the X-axis
	for z in range(-grid_size, grid_size + 1):
		var start = Vector3(-grid_size * cell_size, 0, z * cell_size)
		var end = Vector3(grid_size * cell_size, 0, z * cell_size)
		mesh.surface_add_vertex(start)
		mesh.surface_add_vertex(end)

	# Draw lines parallel to the Z-axis
	for x in range(-grid_size, grid_size + 1):
		var start = Vector3(x * cell_size, 0, -grid_size * cell_size)
		var end = Vector3(x * cell_size, 0, grid_size * cell_size)
		mesh.surface_add_vertex(start)
		mesh.surface_add_vertex(end)

	mesh.surface_end()
	return mesh
