extends Spatial

export var camera_length = 7
export var camera_zoom_speed = 7

const CAMERA_MOUSE_ROTATION_SPEED = 0.001
const CAMERA_X_ROT_MIN = deg2rad(-40)
const CAMERA_X_ROT_MAX = deg2rad(30)

onready var camera_base = $"."
onready var camera_rot = $CameraRot
onready var camera_spring = $CameraRot/SpringArm

var camera_x_rot = 0.0
var spring_length = 0

func _ready():
	spring_length = camera_length
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion:
		var camera_speed = CAMERA_MOUSE_ROTATION_SPEED
		_rotate_camera(event.relative * camera_speed)

func _rotate_camera(move):
	camera_base.rotate_y(-move.x)
	camera_base.orthonormalize() # After relative transforms, camera needs to be renormalized.
	camera_x_rot += move.y
	camera_x_rot = clamp(camera_x_rot, CAMERA_X_ROT_MIN, CAMERA_X_ROT_MAX)
	camera_rot.rotation.x = camera_x_rot
	
func _process(delta):
	_adjust_spring_length(delta)
		
func _adjust_spring_length(delta):
	var curr_length = camera_spring.get_length()
	var diff_length = spring_length - curr_length
	
	# it will never be exactly the same length
	if abs(diff_length) > 0.001:
		var change_length = curr_length + (diff_length * camera_zoom_speed * delta)
		camera_spring.set_length(change_length);

func target_direction_for_motion(motion: Vector2):
	var camera_basis = camera_rot.global_transform.basis
	var camera_x = _normalized_basis(camera_basis.x)
	var camera_z = _normalized_basis(camera_basis.z)
	
	return camera_x * motion.x + camera_z * motion.y

func _normalized_basis(basis):
	basis.y = 0
	return basis.normalized()
