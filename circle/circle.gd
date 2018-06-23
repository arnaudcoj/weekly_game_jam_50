extends StaticBody2D

export var final_scale = 0.4
export var scale_speed = 0.4

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	scale = scale - Vector2(scale_speed * delta, scale_speed * delta)
	scale.x = max(final_scale, scale.x)
	scale.y = max(final_scale, scale.y)