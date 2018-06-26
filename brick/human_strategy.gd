extends Node

onready var brick = get_parent()

func _process(delta):
	human_control()
	
func human_control():
	if Input.is_action_just_pressed("ui_right"):
		brick.start_dash_load(Vector2(1,0))
	elif Input.is_action_just_pressed("ui_left"):
		brick.start_dash_load(Vector2(-1,0))
	elif Input.is_action_just_pressed("ui_up"):
		brick.start_dash_load(Vector2(0,-1))
	elif Input.is_action_just_pressed("ui_down"):
		brick.start_dash_load(Vector2(0,1))
	
	elif Input.is_action_just_released("ui_right"):
		brick.stop_dash_load()
	elif Input.is_action_just_released("ui_left"):
		brick.stop_dash_load()
	elif Input.is_action_just_released("ui_up"):
		brick.stop_dash_load()
	elif Input.is_action_just_released("ui_down"):
		brick.stop_dash_load()
