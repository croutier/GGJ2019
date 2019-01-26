extends StaticBody2D
class_name Ghost
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
enum Ghosts {GHOST_BUTLER, GHOST_MOTHER, GHOST_COOK, GHOST_DAUGHTER, GHOST_DOG, GHOST_WIFE, GHOST_ARTHUR}
export(Ghosts) var ghost_id = 0
# Called when the node enters the scene tree for the first time.

func _ready():
	pass # Replace with function body.

func interact():
	if Inventory.is_item_in_inventory(Quest.get_ghost_item(ghost_id)):
		Quest.set_ghost_status(ghost_id,1)
		Inventory.remove_item_from_inventory(Quest.get_ghost_item(ghost_id))
		Quest.set_fulfilled_ghost_request(ghost_id)
		_change_state()
	else:
		_show_item_needed()
	
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _change_state():
	Quest.get_ghost_status(ghost_id)
	$AnimationPlayer.play("fade")
	pass

func fade_ended():	
	pass
func _show_item_needed():
	pass
