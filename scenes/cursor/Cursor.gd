extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const GRID_SIZE = Vector2(16, 16)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	var mouse_position = get_global_mouse_position()
	
	var target_position = Vector2(
		int(int(mouse_position.x) / 16) * 16,
		int(int(mouse_position.y) / 16) * 16
	)
	
	print(target_position)

	self.position = target_position 
