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
	if(Quest.get_ghost_status(ghost_id)== Quest.GhostStatus.GHOST_STATUS_HUMAN):
		_become_human()
		
	pass # Replace with function body.
func _become_human():
	match ghost_id:
		Quest.Ghosts.GHOST_BUTLER:
			$AnimationPlayer.play("Butler")
		Quest.Ghosts.GHOST_MOTHER:
			$AnimationPlayer.play("Mother")
		Quest.Ghosts.GHOST_COOK:
			$AnimationPlayer.play("CooK")
		Quest.Ghosts.GHOST_DOG:
			$AnimationPlayer.play("Dog")
		Quest.Ghosts.GHOST_WIFE:
			$AnimationPlayer.play("Wife")
					
					
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
	if(ghost_id == Quest.Ghosts.GHOST_WIFE):
		Quest.add_current_ghost_quests(Quest.Ghosts.GHOST_ARTHUR)
		var item = get_parent().get_tree().get_nodes_in_group("item")		
		item[0].enabled = true
	pass
func _show_item_needed():
	Inventory.activate_item(Quest.get_ghost_item(ghost_id))
	$AnimationPlayer.play("show_hint")
	pass
