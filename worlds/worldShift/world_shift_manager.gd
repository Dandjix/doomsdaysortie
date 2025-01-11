extends Node3D
class_name WorldShiftManager

const worldSize = 1000

var _player : WorldShiftPlayer

var _agents : Array

func _addAgent(agent : WorldShiftAgent) -> void:
	_agents.append(agent)
	
func _removeAgent(agent : WorldShiftAgent) -> void:
	_agents.erase(agent)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if _player == null:
		return
	var player_pos = _player.global_position
	
	var halfWorldSize = worldSize/2
	
	if player_pos.x>halfWorldSize :
		_offsetAgents(-halfWorldSize,0)
	if player_pos.x<-halfWorldSize :
		_offsetAgents(halfWorldSize,0)
	if player_pos.z>halfWorldSize :
		_offsetAgents(0,-halfWorldSize)
	if player_pos.z<-halfWorldSize :
		_offsetAgents(0,halfWorldSize)
		
	#print("ppos : ",player_pos)

func _offsetAgents(x : float, y : float) -> void:

	for agent in _agents:
		agent._offset(x,y)
