extends Node2D

export(bool) var is_exterior = false

# Called when the node enters the scene tree for the first time.
func _ready():
	_spawn_character()
	_spawn_ghosts()
	_spawn_items()
	_play_music()
	pass
	 # Replace with function body.
	
func _spawn_character():
	var char_pos
	var spawnpoints = get_tree().get_nodes_in_group("spawnpoint")
	for spawnpoint in spawnpoints:
		if spawnpoint.spawn_id == Quest.spawn_point:
			char_pos = spawnpoint.global_position
	if char_pos is Vector2:
		get_tree().get_nodes_in_group("character")[0].global_position = char_pos
	else:
		printerr("No spawnpoint found for character. :(")
	pass
	
func _spawn_ghosts():
	var ghosts = get_tree().get_nodes_in_group("ghost")
	var spawnpoints = get_tree().get_nodes_in_group("ghostspawnpoint")
	for ghost in ghosts:
		var ghost_pos
		for spawnpoint in spawnpoints:
			if  spawnpoint.ghost_id == ghost.ghost_id and spawnpoint.ghost_status_id == Quest.get_ghost_status(ghost.ghost_id):
				ghost_pos = spawnpoint.global_position
		if ghost_pos is Vector2:
			ghost.global_position = ghost_pos
		else:
			printerr("No spawnpoint found for ghost id %d. Skipping" % [ghost.ghost_id])
	pass
	
func _spawn_items():
	var items = get_tree().get_nodes_in_group("item")
	
	for item in items:
		item.enabled = Inventory.is_active(item.type)
		
	pass
	
func _play_music():
	if Quest.was_outdoors == true and is_exterior == false:
		if Quest.entered_house_first_time == false:
			Music.play("indoors_first_time")
			Quest.entered_house_first_time = true
		else:
			Music.play("indoors")
		Quest.was_outdoors = is_exterior
	elif Quest.was_outdoors == false and is_exterior == true:
		Music.play("outdoors")
		Quest.was_outdoors = is_exterior

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
