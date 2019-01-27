extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	if(Quest.trap_door_open):
		get_parent().get_node("TrapDoor").is_active = true
	
	pass # Replace with function body.	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if(Quest.get_fulfilled_ghost_request(Quest.Ghosts.GHOST_DOG)):
		Quest.open_trap_door()
		get_parent().get_node("TrapDoor").is_active = true
	pass # Replace with function body.
