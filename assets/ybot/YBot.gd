extends KinematicBody

export var speed = 10
export var acceleration = 700
export var friction = 1600

onready var input := $PlayerInput
onready var gravity = ProjectSettings.get_setting("physics/3d/default_gravity") * ProjectSettings.get_setting("physics/3d/default_gravity_vector")

var velocity = Vector3.ZERO

func _physics_process(delta):
	var motion = input.get_move_vector()
	print(motion)
	var is_moving = motion.length() > 0.01
	var accel = acceleration if is_moving else friction
	velocity = velocity.move_toward(motion * speed, accel * delta)
	velocity += gravity
	
	velocity = move_and_slide(velocity, Vector3.UP)
