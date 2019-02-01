extends Camera2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	var scene_limits = get_tree().get_nodes_in_group("camera_limits")
	if scene_limits.size() != 0:
		var top_left = scene_limits[0].get_node("top_left")
		var bottom_right = scene_limits[0].get_node("bottom_right")
		limit_left = top_left.global_position.x
		limit_top = top_left.global_position.y
		limit_right = bottom_right.global_position.x
		limit_bottom = bottom_right.global_position.y
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
