extends RigidBody2D

signal brick_dead

export var speed = 800

func die():
	emit_signal("brick_dead", self)
	queue_free()
	
func is_brick():
	return true
