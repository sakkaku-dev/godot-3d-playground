extends AnimationTree

func update_state(player: KinematicBody, input: PlayerInput):
	set("parameters/conditions/floor", abs(player.velocity.y) <= 0.1)
	set("parameters/conditions/run", player.velocity.length() > 0.01)
	set("parameters/conditions/idle", not get("parameters/conditions/run"))
	
	set("parameters/conditions/not_floor", not get("parameters/conditions/floor"))
