extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	_spawn_character()
	_spawn_ghosts()
	pass
	 # Replace with function body.
	
func _spawn_character():
	var spawnpoint
	for child in get_children():
		if child is SpawnPoint and child.spawn_id == Quest.spawn_point:
			spawnpoint = child.global_position
	$Character.global_position = spawnpoint
	pass
	
func _spawn_ghosts():
	for child in get_children():
		var spawnpoint
		if child is Ghost :
			for spawn_child in get_children():
				if spawn_child is GhostSpawnPoint and spawn_child.ghost_id == child.ghost_id and spawn_child.ghost_status_id == Quest.get_ghost_status(child.ghost_id):
					spawnpoint = spawn_child.global_position
		
			child.global_position = spawnpoint
			
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
