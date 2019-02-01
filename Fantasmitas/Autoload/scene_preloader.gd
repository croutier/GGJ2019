extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var scenes = [
	preload("res://Scenes/rooms/ROOM_BASEMENT.tscn"),
	preload("res://Scenes/rooms/ROOM_BEDROOM.tscn"),
	preload("res://Scenes/rooms/ROOM_CASTLE_DOOR.tscn"),
	preload("res://Scenes/rooms/ROOM_DINING_ROOM.tscn"),
	preload("res://Scenes/rooms/ROOM_GARDEN.tscn"),
	preload("res://Scenes/rooms/ROOM_HALL.tscn"),
	preload("res://Scenes/rooms/ROOM_KITCHEN.tscn"),
	preload("res://Scenes/rooms/ROOM_MAIN_LOBBY.tscn"),
	preload("res://Scenes/rooms/ROOM_PANTRY.tscn"),
	preload("res://Scenes/rooms/ROOM_PLAYROOM.tscn"),
	preload("res://Scenes/rooms/ROOM_ROAD.tscn"),
	preload("res://Scenes/rooms/ROOM_STAIRCASE.tscn")
]
	
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
