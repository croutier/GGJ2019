extends Node

enum Ghosts {GHOST_BUTLER, GHOST_MOTHER, GHOST_COOK, GHOST_DAUGHTER, GHOST_DOG, GHOST_WIFE, GHOST_ARTHUR}

enum GhostStatus {GHOST_STATUS_BLOB, GHOST_STATUS_HUMAN, GHOST_STATUS_ALIVE}

enum SpawnPoints {SPAWN_NORTH, SPAWN_EAST, SPAWN_SOUTH, SPAWN_WEST}

var trap_door_open = false

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
	Ghosts.GHOST_BUTLER : Inventory.Items.ITEM_KEY,
	Ghosts.GHOST_MOTHER : Inventory.Items.ITEM_FATHERS_ASHES,
	Ghosts.GHOST_COOK : Inventory.Items.ITEM_NECKLACE,
	Ghosts.GHOST_DAUGHTER : Inventory.Items.ITEM_TEDDY_BEAR,
	Ghosts.GHOST_DOG : Inventory.Items.ITEM_COLLAR,
	Ghosts.GHOST_WIFE : Inventory.Items.ITEM_RING,
	Ghosts.GHOST_ARTHUR : Inventory.Items.ITEM_LETTER,
}

var ghost_status = {
	Ghosts.GHOST_BUTLER : GhostStatus.GHOST_STATUS_BLOB,
	Ghosts.GHOST_MOTHER : GhostStatus.GHOST_STATUS_BLOB,
	Ghosts.GHOST_COOK : GhostStatus.GHOST_STATUS_BLOB,
	Ghosts.GHOST_DAUGHTER : GhostStatus.GHOST_STATUS_BLOB,
	Ghosts.GHOST_DOG : GhostStatus.GHOST_STATUS_BLOB,
	Ghosts.GHOST_WIFE : GhostStatus.GHOST_STATUS_BLOB,
	Ghosts.GHOST_ARTHUR: GhostStatus.GHOST_STATUS_BLOB,
}

var room_status = {
	Rooms.ROOM_ROAD : RoomStatus.ROOM_STATUS_PRESENT, 
	Rooms.ROOM_CASTLE_DOOR : RoomStatus.ROOM_STATUS_PRESENT, 
	Rooms.ROOM_MAIN_LOBBY : RoomStatus.ROOM_STATUS_PRESENT, 
	Rooms.ROOM_DINING_ROOM : RoomStatus.ROOM_STATUS_PRESENT, 
	Rooms.ROOM_PANTRY : RoomStatus.ROOM_STATUS_PRESENT, 
	Rooms.ROOM_GARDEN : RoomStatus.ROOM_STATUS_PRESENT, 
	Rooms.ROOM_KITCHEN : RoomStatus.ROOM_STATUS_PRESENT, 
	Rooms.ROOM_HALL : RoomStatus.ROOM_STATUS_PRESENT, 
	Rooms.ROOM_STAIRCASE : RoomStatus.ROOM_STATUS_PRESENT, 
	Rooms.ROOM_PLAYROOM : RoomStatus.ROOM_STATUS_PRESENT, 
	Rooms.ROOM_BEDROOM : RoomStatus.ROOM_STATUS_PRESENT, 
	Rooms.ROOM_BASEMENT : RoomStatus.ROOM_STATUS_PRESENT
}

var current_ghost_quests = []

var ghosts_quests_fulfilled = []

var spawn_point = SpawnPoints.SPAWN_WEST

func set_ghost_status(ghost, status):
	ghost_status[ghost] = status

func get_ghost_status(ghost):
	return ghost_status[ghost]

func get_ghost_item(ghost):
	return ghost_items[ghost]
func should_trigger_arthur_quest():
	return Ghosts.size() == ghosts_quests_fulfilled.size()-1
func set_room_status(room, status):
	room_status[room] = status
func open_trap_door():
	trap_door_open = true
	
func get_room_status(room):
	return room_status[room]
	
func set_fulfilled_ghost_request(ghost):
	ghosts_quests_fulfilled.append(ghost)
func get_fulfilled_ghost_request(ghost):
	return ghost in ghosts_quests_fulfilled
func are_all_ghost_requests_fulfilled():
	return Ghosts.size() == ghosts_quests_fulfilled.size()
	
func add_current_ghost_quests(ghost):
	current_ghost_quests.append(ghost)
	
func remove_current_ghost_quest(ghost):
	var index = current_ghost_quests.find(ghost)
	if index > -1:
		current_ghost_quests.remove(index)
		

func set_spawn_point(spawn):
	spawn_point = spawn
	
func clear_spawn_point():
	spawn_point = null
	