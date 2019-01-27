extends StaticBody2D

const inventory = preload("res://Autoload/inventory.gd")
#export(int, "ITEM_KEY", "ITEM_FATHERS_ASHES", "ITEM_COLLAR", "ITEM_NECKLACE", "ITEM_TEDDY_BEAR", "ITEM_RING", "ITEM_LETTER") var type = 0
export(inventory.Items) var type = 0