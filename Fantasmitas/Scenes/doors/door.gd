extends Area2D

enum SpawnPoints {SPAWN_NORTH, SPAWN_EAST, SPAWN_SOUTH, SPAN_WEST}
export var on_enter_load_scene = ""
export (SpawnPoints)var on_enter_set_spawn_point = ""


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Door_body_entered(body:KinematicBody2D):
	if body.is_in_group("character"):
		Quest.set_spawn_point(on_enter_set_spawn_point)
		get_tree().call_deferred("change_scene", on_enter_load_scene)