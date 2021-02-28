extends AnimationTree

const MOVE_BLEND = "parameters/Move/blend_amount"

func move(blend: Vector2):
	set(MOVE_BLEND, blend.length())
