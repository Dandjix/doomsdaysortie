@tool
extends MeshInstance3D

class_name Terrain

func destroy_terrain() -> void:
	var mesh_data = []
	mesh_data.resize(ArrayMesh.ARRAY_MAX)
	var mesh = ArrayMesh.new()
	mesh.add_surface_from_arrays(mesh.PRIMITIVE_TRIANGLES, mesh_data,[],{},Mesh.ARRAY_FLAG_USES_EMPTY_VERTEX_ARRAY)
	self.mesh = mesh
	print("mesh deleted !")

func generate_terrain() -> void:
	
	#var meshData = [
	#PackedVector3Array(), #vertex
	#PackedVector3Array(), #normal x1
	#PoolRealArray(), #tangent x4
	#PoolColorArray(), #color x1
	#PackedVector2Array(), #texture uv x1
	#PackedVector2Array(), #texture uv 2 x1
	#PoolIntArray() or PoolRealArray(), #bones x4
	#PoolRealArray(), #weights x4
	#PoolIntArray()		#index
	#]
	
	var mesh_data = []
	mesh_data.resize(ArrayMesh.ARRAY_MAX)
	mesh_data[ArrayMesh.ARRAY_VERTEX] = PackedVector3Array(
		[
			Vector3(0, 0, 0),
			Vector3(1, 0, 0),
			Vector3(1, 1, 0),
			Vector3(0, 1, 0)
		]
	)
	mesh_data[ArrayMesh.ARRAY_INDEX] = PackedInt32Array(
		[
			0,1,2,
			0,2,3
		]
	)
	
	mesh_data[ArrayMesh.ARRAY_NORMAL] = PackedVector3Array(
		[
			Vector3(0,0,-1),
			Vector3(0,0,-1),
			Vector3(0,0,-1),
			Vector3(0,0,-1)
		]
	)
	
	var mesh = ArrayMesh.new()
	mesh.add_surface_from_arrays(mesh.PRIMITIVE_TRIANGLES, mesh_data)
	self.mesh = mesh
	print("Mesh created!")

#const spinSpeed : float = 1
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#rotate_y(delta*spinSpeed)
