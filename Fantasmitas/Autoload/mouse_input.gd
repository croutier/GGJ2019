extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var active: = false
var last_pos: = Vector2()
var movement: = Vector2()
var deadzone:= 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	deadzone = get_viewport_rect().size.y / 16
	pass # Replace with function body.

func _unhandled_input(event):
	if event is InputEventMouseButton:
		last_pos = event.position
		if event.pressed:
			#active = true
			pass
		else:
			active = false
			movement = Vector2()
	if event is InputEventMouseMotion and Input.is_mouse_button_pressed(BUTTON_LEFT):
		movement = event.position - last_pos
		if movement.length_squared() > pow(deadzone, 2):
			active = true
		else:
			active = false
		
