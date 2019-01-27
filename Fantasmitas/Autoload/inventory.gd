extends Node

# List of items in the game
enum Items {ITEM_KEY, ITEM_FATHERS_ASHES, ITEM_COLLAR, ITEM_NECKLACE, ITEM_TEDDY_BEAR, ITEM_RING, ITEM_LETTER}

var item_status={
	Items.ITEM_KEY : false,
	Items.ITEM_FATHERS_ASHES : false,
	Items.ITEM_COLLAR : false,
	Items.ITEM_NECKLACE : false,
	Items.ITEM_TEDDY_BEAR : false,
	Items.ITEM_RING : false,
	Items.ITEM_LETTER : false,	
	}

var items_allowed_to_hold = []

var items_held = []

func add_item_to_inventory(item):	
	item_status[item] = false;
	items_held.append(item)

func remove_item_from_inventory(item):
	var index = items_held.find(item)
	if index > -1:
		items_held.remove(index)

func is_item_in_inventory(item):
	return item in items_held

func activate_item(item):
	item_status[item] = true;
	
func is_active(item):
	return item_status[item]
