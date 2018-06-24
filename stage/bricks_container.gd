extends Node2D

signal brick_dead

var winner = null

func _ready():
	for brick in get_children():
		brick.connect("brick_dead", self, "on_brick_dead")
		
func on_brick_dead(dead_brick):
	if get_child_count() == 2:
		for child in get_children():
			if child != dead_brick:
				winner = child
				break
	emit_signal("brick_dead", dead_brick)

func get_remaining_bricks_count():
	return get_child_count()
	
func get_winner():
	return winner