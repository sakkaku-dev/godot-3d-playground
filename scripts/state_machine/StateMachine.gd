extends Node

class_name StateMachine

export var player_path: NodePath
onready var player = get_node(player_path)

export var input_path: NodePath
onready var input = get_node(input_path)

export var initial_state: NodePath
onready var state = get_node(initial_state)

func _ready():
	if state == null:
		for child in get_children():
			state = child
			break
	state.enter()

func _unhandled_input(event):
	input.handle_input(event)
	state.handle_input(input)


func _physics_process(delta: float):
	state.update(delta)
	

func transition_to(new_state, msg := {}):
	if state != null:
		state.exit()
	state = new_state
	state.enter(msg)

