extends Node

class_name State

onready var state_machine = _get_state_machine(self)

func _get_state_machine(node: Node):
	if node == null: return null
	
	var parent = node.get_parent()
	if parent is StateMachine:
		return parent
	
	return _get_state_machine(parent)

func enter(msg := {}):
	pass


func exit():
	pass


func handle_input(input: InputReader):
	pass


func update(delta: float):
	pass

