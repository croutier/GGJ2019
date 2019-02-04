extends StaticBody2D
class_name Ghost
var quest_complete = false
const quest = preload("res://Autoload/quest.gd")

#enum Ghosts {GHOST_BUTLER, GHOST_MOTHER, GHOST_COOK, GHOST_DAUGHTER, GHOST_DOG, GHOST_WIFE, GHOST_ARTHUR}
export(quest.Ghosts) var ghost_id = 0
export(Texture) var memory setget _set_memory, _get_memory
export(Texture) var item setget _set_item, _get_item
export(Color) var color_tint setget _set_color_tint, _get_color_tint
export(String) var memory_text setget _set_memory_text, _get_memory_text

func _set_memory_text(txt):
	$Memory/TextureRect/Label.text = txt
	
func _get_memory_text():
	return $Memory/TextureRect/Label.text

func _set_color_tint(col):
	call_deferred("_set_color_tint_deferred", col)
	
func _set_color_tint_deferred(col):
	get_node("AnimatedSprite").self_modulate = col
	
func _get_color_tint():
	return get_node("AnimatedSprite").self_modulate

func _set_item(tex):
	$hint/item_needed.texture = tex

func _get_item():
	return $hint/item_needed.texture

func _set_memory(tex):
	$Memory/TextureRect.texture = tex

func _get_memory():
	return $Memory/TextureRect.texture
# Called when the node enters the scene tree for the first time.


func _ready():
	if Quest.get_fulfilled_ghost_request(ghost_id) and ghost_id == Quest.Ghosts.GHOST_BUTLER:
		if owner.has_node("YSort/CastleDoor"):
			owner.get_node("YSort/CastleDoor").set_active(true)
	if(Quest.get_ghost_status(ghost_id)== Quest.GhostStatus.GHOST_STATUS_HUMAN):
		$AnimationPlayer.play("human")
		_become_human()
		
	pass # Replace with function body.
func _become_human():
	match ghost_id:
		Quest.Ghosts.GHOST_BUTLER:
			$AnimatedSprite.play("Butler")
		Quest.Ghosts.GHOST_MOTHER:
			$AnimatedSprite.play("Mother")
		Quest.Ghosts.GHOST_COOK:
			$AnimatedSprite.play("Cook")
		Quest.Ghosts.GHOST_DOG:
			$AnimatedSprite.play("Dog")
		Quest.Ghosts.GHOST_WIFE:
			$AnimatedSprite.play("Wife")
		Quest.Ghosts.GHOST_DAUGHTER:
			$AnimatedSprite.play("Daughter")
		_:
			printerr("Matched no ghost to turn into human")
	return

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

func _change_state():
	Quest.get_ghost_status(ghost_id)
	get_tree().set_group("character", "can_move", false)
	$AnimationPlayer.play("fade")
	yield($AnimationPlayer, "animation_finished")
	get_tree().set_group("character", "can_move", true)
	_become_human()
	pass

func fade_ended():
	if ghost_id == Quest.Ghosts.GHOST_BUTLER:
		owner.get_node("YSort/CastleDoor").set_active(true)
	if(ghost_id == Quest.Ghosts.GHOST_WIFE):
		Quest.add_current_ghost_quests(Quest.Ghosts.GHOST_ARTHUR)
		var item = get_parent().get_tree().get_nodes_in_group("item")
		item[0].enabled = true
	pass

func _show_item_needed():
	Inventory.activate_item(Quest.get_ghost_item(ghost_id))
	$AnimationPlayer.play("show_hint")
	pass
