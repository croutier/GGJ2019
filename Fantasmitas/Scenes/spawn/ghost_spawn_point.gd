extends Node
class_name GhostSpawnPoint

#enum Ghosts {GHOST_BUTLER, GHOST_MOTHER, GHOST_COOK, GHOST_DAUGHTER, GHOST_DOG, GHOST_WIFE, GHOST_ARTHUR}
#enum GhostStatus {GHOST_STATUS_BLOB, GHOST_STATUS_HUMAN, GHOST_STATUS_ALIVE}
const quest = preload("res://Autoload/quest.gd")

export(quest.Ghosts) var ghost_id = 0
export(quest.GhostStatus) var ghost_status_id = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
