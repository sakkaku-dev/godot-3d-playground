extends Node

"""
Reads InputEvents and tracks which inputs are pressed for all devices
"""

class_name InputReader

var input_types = InputMap.get_actions()

var just_pressed = []
var inputs = []
var action_strength = {}


func handle_input(event: InputEvent) -> void:
	_update_action_strength(event)

	var action = _get_action_for_event(event)
	if action == "":
		return

	# TODO: handle joypad move events
	if event.is_action_pressed(action):
		if not inputs.has(action):
			inputs.append(action)
		if not just_pressed.has(action):
			just_pressed.append(action)
	if event.is_action_released(action):
		if inputs.has(action):
			inputs.erase(action)


func _process(delta):
	just_pressed = []


func _update_action_strength(event: InputEvent) -> void:
	for k in input_types:
		if event.is_action(k):
			action_strength[k] = event.get_action_strength(k)


func _get_action_for_event(event: InputEvent) -> String:
	for action in input_types:
		if event.is_action(action):
			return action

	return ""


func is_pressed_any(keys: Array) -> bool:
	for k in keys:
		if inputs.has(k):
			return true
	return false


func is_pressed(keys: Array) -> bool:
	for k in keys:
		if not inputs.has(k):
			return false
	return true


func is_just_pressed(key: String) -> bool:
	return just_pressed.has(key)


func get_action_strength(key: String) -> float:
	if action_strength.has(key):
		return action_strength[key]

	return 0.0
