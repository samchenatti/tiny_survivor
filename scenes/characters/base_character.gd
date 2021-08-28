extends Node2D

class_name BaseCharacter

enum State {
	IDLE,
	ATTACKING,
	DEFENDING,
	RECEIVING_DAMAGE,
	WALKING,
	JUMPING
}

const state_to_anim = {
	State.IDLE: 'idle',
	State.ATTACKING: 'atacking',
	State.DEFENDING: 'defending',
	State.RECEIVING_DAMAGE: 'idle',
	State.WALKING: 'walking',
	State.JUMPING: 'jumping'
}

enum Face {
	RIGHT,
	LEFT
}

const GRID_SIZE = Vector2(16, 16)

var state = State.IDLE
var state_machine = null

export(Face) var facing = Face.RIGHT
export(int) var speed = 0


func _ready():
	state_machine = $AnimationTree.get('parameters/playback')

func process():
	state_machine.travel(state_to_anim[self.state])
	

func face(side: int):
	self.facing = side

	scale.x = scale.y
	if facing == Face.LEFT:
		scale.x = -1 * scale.y

func set_state(state: int):
	self.state = state
