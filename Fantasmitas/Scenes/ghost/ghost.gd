extends StaticBody2D
class_name Ghost
var quest_complete = false
const quest = preload("res://Autoload/quest.gd")

#enum Ghosts {GHOST_BUTLER, GHOST_MOTHER, GHOST_COOK, GHOST_DAUGHTER, GHOST_DOG, GHOST_WIFE, GHOST_ARTHUR}
export(quest.Ghosts) var ghost_id = 0
# Called when the node enters the scene tree for the first time.

func _ready():
	if Quest.get_fulfilled_ghost_request(ghost_id) and ghost_id == Quest.Ghosts.GHOST_BUTLER:
		get_parent().get_node("Door2").is_active = true
	pass # Replace with function body.

func interact():
	if(Quest.get_fulfilled_ghost_request(ghost_id)):
		return
		
	if Inventory.is_item_in_inventory(Quest.get_ghost_item(ghost_id)):
		Quest.set_ghost_status(ghost_id,1)
		Quest.set_fulfilled_ghost_request(ghost_id)
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
	if ghost_id == Quest.Ghosts.GHOST_BUTLER:
		get_parent().get_node("Door2").is_active = true
	pass
func _show_item_needed():
	Inventory.activate_item(Quest.get_ghost_item(ghost_id))
	$AnimationPlayer.play("show_hint")
	pass
