extends RigidBody2D

export var max_speed = 2500

func _ready():
	pass

func _on_Area2D_body_entered(body):
	if body.has_method("is_ball_bounds") and body.is_ball_bounds():
		var new_velocity = linear_velocity.normalized()
		new_velocity.y = -new_velocity.y
		new_velocity = new_velocity * min(linear_velocity.length() * 1.05, max_speed)
		linear_velocity = new_velocity
	elif body.has_method("is_brick") and body.is_brick():
		var new_velocity = linear_velocity.normalized()
		new_velocity.y = -new_velocity.y
		new_velocity.x = -new_velocity.x
		new_velocity = new_velocity * min(linear_velocity.length(), max_speed)
		linear_velocity = new_velocity
		body.queue_free()
