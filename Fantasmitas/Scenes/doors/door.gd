extends Area2D
class_name Door

const quest = preload("res://Autoload/quest.gd")

#enum SpawnPoints {SPAWN_NORTH, SPAWN_EAST, SPAWN_SOUTH, SPAN_WEST}
export var on_enter_load_scene = ""
export (quest.SpawnPoints)var on_enter_set_spawn_point = ""
export var is_active = true


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func set_active(active):
	is_active = active

func _on_Door_body_entered(body:KinematicBody2D):
	if body.is_in_group("character") and is_active:
		Quest.set_spawn_point(on_enter_set_spawn_point)
		get_tree().call_deferred("change_scene", on_enter_load_scene)