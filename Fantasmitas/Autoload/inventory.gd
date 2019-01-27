extends Node

# List of items in the game
enum Items {ITEM_KEY, ITEM_FATHERS_ASHES, ITEM_COLLAR, ITEM_NECKLACE, ITEM_TEDDY_BEAR, ITEM_RING, ITEM_LETTER}

var items_allowed_to_hold = []

var items_held = []

func add_item_to_inventory(item):
	if item in items_allowed_to_hold and not item in items_held:
		items_held.append(item)

func remove_item_from_inventory(item):
	var index = items_held.find(item)
	if index > -1:
		items_held.remove(index)

func is_item_in_inventory(item):
	return item in items_held

func set_items_allowed_to_hold(items: Array):
	items_allowed_to_hold = items