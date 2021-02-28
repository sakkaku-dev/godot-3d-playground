extends State

export var move_state_path: NodePath
onready var move_state: State = get_node(move_state_path)

func enter(msg := {}):
	state_machine.player.velocity = Vector3.ZERO


func exit():
	pass


func handle_input(input: InputReader):
	pass
#	if input.is_pressed_any(PlayerInput.MOVE_INPUTS):
#		state_machine.transition_to(move_state)


func update(delta: float):
	pass

