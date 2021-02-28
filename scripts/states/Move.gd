extends State

export var idle_state_path: NodePath
onready var idle_state: State = get_node(idle_state_path)

func enter(msg := {}):
	pass


func exit():
	pass


func handle_input(input: InputReader):
	state_machine.player.motion = _get_move_vector(input)


func update(delta):
	state_machine.player.update_velocity(delta)
	if state_machine.player.velocity.length() <= 0.01:
		state_machine.transition_to(idle_state)


func _get_move_vector(input: InputReader) -> Vector2:
	return Vector2(
		input.get_action_strength("move_right") - input.get_action_strength("move_left"),
		input.get_action_strength("move_back") - input.get_action_strength("move_forward")
	)
