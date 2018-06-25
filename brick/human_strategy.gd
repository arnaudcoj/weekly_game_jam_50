extends Node

onready var brick = get_parent()

func _process(delta):
	human_control()
	
func human_control():
	if Input.is_action_just_pressed("ui_right"):
		brick.apply_impulse(Vector2(0,0), Vector2(brick.speed,0))
	if Input.is_action_just_pressed("ui_left"):
		brick.apply_impulse(Vector2(0,0), Vector2(-brick.speed,0))
	if Input.is_action_just_pressed("ui_up"):
		brick.apply_impulse(Vector2(0,0), Vector2(0,-brick.speed))
	if Input.is_action_just_pressed("ui_down"):
		brick.apply_impulse(Vector2(0,0), Vector2(0,brick.speed))
