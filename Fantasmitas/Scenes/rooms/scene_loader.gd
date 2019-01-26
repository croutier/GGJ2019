extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	_spawn_character()
	
	pass
	 # Replace with function body.
	
func _spawn_character():
	var spawnpoint
	for child in get_children():
		if child is SpawnPoint and child.spawn_id == Quest.spawn_point:
			spawnpoint = child.global_position
	$Character.global_position = spawnpoint
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
