extends "res://scenes/characters/base_character.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	.process()

func to_the_right(target_position: Vector2):
	return target_position.x > self.position.x
	

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index != BUTTON_LEFT:
			return
			
		var mouse_position = get_global_mouse_position()
		
		var target_position = Vector2(
			int(int(mouse_position.x) / 16) * 16 + 8,
			int(int(mouse_position.y) / 16) * 16 + 2
		)
		
		$WalkTween.interpolate_property(
			self,
			"position",
			self.position,
			target_position,
			1,
			Tween.TRANS_SINE
		)
		
		$WalkTween.start()

		if to_the_right(mouse_position):
			face(Face.RIGHT)
		else:
			face(Face.LEFT)
			
		set_state(State.WALKING)


func _on_WalkTween_tween_completed(object, key):
	set_state(State.IDLE)
