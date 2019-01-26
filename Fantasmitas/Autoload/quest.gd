extends Node

enum Ghosts {GHOST_BUTLER, GHOST_MOTHER, GHOST_COOK, GHOST_DAUGHTER, GHOST_DOG, GHOST_WIFE, GHOST_ARTHUR}

enum GhostStatus {GHOST_STATUS_BLOB, GHOST_STATUS_HUMAN, GHOST_STATUS_ALIVE}

enum SpawnPoints {SPAWN_NORTH, SPAWN_EAST, SPAWN_SOUTH, SPAN_WEST}

enum Rooms {ROOM_ROAD, 
	ROOM_CASTLE_DOOR, 
	ROOM_MAIN_LOBBY, 
	ROOM_DINING_ROOM, 
	ROOM_PANTRY, 
	ROOM_GARDEN, 
	ROOM_KITCHEN, 
	ROOM_HALL, 
	ROOM_STAIRCASE, 
	ROOM_PLAYROOM, 
	ROOM_BEDROOM, 
	ROOM_BASEMENT}

enum RoomStatus {ROOM_STATUS_PRESENT, ROOM_STATUS_PAST}

onready var ghost_items = {
	GHOST_BUTLER: Inventory.Items.INVENTORY_KEY,
	GHOST_MOTHER: Inventory.Items.INVENTORY_FATHERS_ASHES,
	GHOST_COOK: Inventory.Items.INVENTORY_NECKLACE,
	GHOST_DAUGHTER: Inventory.Items.INVENTORY_TEDDY_BEAR,
	GHOST_DOG: Inventory.Items.INVENTORY_COLLAR,
	GHOST_WIFE: Inventory.Items.INVENTORY_RING,
	GHOST_ARTHUR: Inventory.Items.INVENTORY_LETTER,
}

var ghost_status = {
	GHOST_BUTLER: GHOST_STATUS_BLOB,
	GHOST_MOTHER: GHOST_STATUS_BLOB,
	GHOST_COOK: GHOST_STATUS_BLOB,
	GHOST_DAUGHTER: GHOST_STATUS_BLOB,
	GHOST_DOG: GHOST_STATUS_BLOB,
	GHOST_WIFE: GHOST_STATUS_BLOB,
}

var room_status = {
	ROOM_ROAD: ROOM_STATUS_PRESENT, 
	ROOM_CASTLE_DOOR: ROOM_STATUS_PRESENT, 
	ROOM_MAIN_LOBBY: ROOM_STATUS_PRESENT, 
	ROOM_DINING_ROOM: ROOM_STATUS_PRESENT, 
	ROOM_PANTRY: ROOM_STATUS_PRESENT, 
	ROOM_GARDEN: ROOM_STATUS_PRESENT, 
	ROOM_KITCHEN: ROOM_STATUS_PRESENT, 
	ROOM_HALL: ROOM_STATUS_PRESENT, 
	ROOM_STAIRCASE: ROOM_STATUS_PRESENT, 
	ROOM_PLAYROOM: ROOM_STATUS_PRESENT, 
	ROOM_BEDROOM: ROOM_STATUS_PRESENT, 
	ROOM_BASEMENT: ROOM_STATUS_PRESENT
}

var current_ghost_quests = []

var ghosts_quests_fulfilled = []

var spawn_point = null

func set_ghost_status(ghost, status):
	ghost_status[ghost] = status

func get_ghost_status(ghost):
	return ghost_status[ghost]

func get_ghost_item(ghost):
	return ghost_items[ghost]

func set_room_status(room, status):
	room_status[room] = status

func get_room_status(room):
	return room_status[room]
	
func set_fulfilled_ghost_request(ghost):
	ghosts_quests_fulfilled.add(ghost)

func are_all_ghost_requests_fulfilled():
	return Ghosts.size() == ghosts_quests_fulfilled.size()
	
func add_current_ghost_quests(ghost):
	current_ghost_quests.add(ghost)
	
func remove_current_ghost_quest(ghost):
	var index = current_ghost_quests.find(ghost)
	if index > -1:
		current_ghost_quests.remove(index)
		

func set_spawn_point(spawn):
	spawn_point = spawn
	
func clear_spawn_point():
	spawn_point = null