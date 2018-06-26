extends Node

onready var brick = get_parent()

func _ready():
	$Timer.wait_time = rand_range(.2, 5.0)
	$Timer.start()

func _on_Timer_timeout():
	var dir_choice = randi() % 4
	
	if dir_choice == 0 :
		brick.apply_impulse(Vector2(0,0), Vector2(brick.speed * rand_range(0.2,1.0),0))
	elif dir_choice == 1 :
		brick.apply_impulse(Vector2(0,0), Vector2(-brick.speed * rand_range(0.2,1.0),0))
	elif dir_choice == 2 :
		brick.apply_impulse(Vector2(0,0), Vector2(0,-brick.speed * rand_range(0.2,1.0)))
	elif dir_choice == 3 :
		brick.apply_impulse(Vector2(0,0), Vector2(0,brick.speed * rand_range(0.2,1.0)))
	
	$Timer.wait_time = rand_range(1.0, 5.0)
	$Timer.start()