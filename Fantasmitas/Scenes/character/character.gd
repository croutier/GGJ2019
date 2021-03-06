extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var anim_controller = $AnimationPlayer
onready var area2D = $Area2D
var can_move = true
var mouse_motion = {
	last_pos = Vector2(),
	movement = Vector2(),
	animation = "stop"
	}
# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D.connect("body_entered", self, "_on_body_enter")
	anim_controller.play("idle")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not can_move:
		_set_anim("stop")
		return
	var movement : = Vector2()

	if(Input.is_action_pressed("ui_right")):
		movement = Vector2(1,0)
		_set_anim("R_walk_anim")
	elif(Input.is_action_pressed("ui_left")):
		movement = Vector2(-1,0)
		_set_anim("L_walk_anim")
	elif(Input.is_action_pressed("ui_up")):
		movement = Vector2(0,-1)
		_set_anim("U_walk_anim")
	elif(Input.is_action_pressed("ui_down")):
		movement = Vector2(0,1)
		_set_anim("D_walk_anim")
	elif MouseInput.active:
		_get_mouse_motion(MouseInput.movement)
		movement = mouse_motion.movement
		_set_anim(mouse_motion.animation)
	else:
		_set_anim("stop")

	#move_and_collide(movement *800 *delta)
	var running = int (Input.is_key_pressed(KEY_SHIFT))
	move_and_slide(movement * (800 + 1000 * running))
	pass

func _set_anim(anim):
	if anim == "stop":
		anim_controller.seek(0, true)
		anim_controller.stop()
		return
	if anim != anim_controller.current_animation:
		anim_controller.play(anim,-1, 2)
		anim_controller.seek(0.5, true)
	pass

func _on_body_enter(body):
	if body.is_in_group("item"):
		if(body.type == Inventory.Items.ITEM_LETTER):
			get_tree().call_deferred("change_scene", "res://Scenes/endgame/Endgame.tscn")
		Inventory.add_item_to_inventory(body.type)
		body.queue_free()
	if body.is_in_group("ghost"):
		body.interact()
		
	pass

func _get_mouse_motion(mouse_pos:Vector2) -> void:
	var movement = mouse_pos.normalized()
	var animation = "stop"
	if abs(mouse_pos.x) > abs(mouse_pos.y):
		movement.y = 0
		if movement.x > 0:
			animation = "R_walk_anim"
		else:
			animation = "L_walk_anim"
	else:
		movement.x = 0
		if movement.y > 0:
			animation = "D_walk_anim"
		else:
			animation = "U_walk_anim"
	mouse_motion.movement = movement
	mouse_motion.animation = animation
