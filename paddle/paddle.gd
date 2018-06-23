extends KinematicBody2D

export (NodePath) var ball

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if get_node(ball) != null :
		follow_ball()
	
func follow_ball():
	move_and_collide(Vector2(get_node(ball).position.x - position.x, 0))

func is_paddle():
	return true