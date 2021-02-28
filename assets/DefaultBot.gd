extends Spatial

# Sets default values for animation so I don't have to set it on every import
const LOOP_ANIMATIONS = ["Idle", "Run", "Walk", "Fall"]

onready var animation := $AnimationPlayer

func _ready():
	for anim in LOOP_ANIMATIONS:
		animation.get_animation(anim).loop = true
