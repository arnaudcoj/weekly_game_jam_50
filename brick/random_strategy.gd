extends Node

onready var brick = get_parent()

var loading = false

func _ready():
	$Timer.wait_time = rand_range(.2, 5.0)
	$Timer.start()
	loading = false

func _on_Timer_timeout():
	if loading:
		brick.stop_dash_load()
		$Timer.wait_time = rand_range(2.0, 5.0)
		loading = false
	else:
		var dir_choice = randi() % 4
		
		if dir_choice == 0 :
			brick.start_dash_load(Vector2(1,0))
		elif dir_choice == 1 :
			brick.start_dash_load(Vector2(-1,0))
		elif dir_choice == 2 :
			brick.start_dash_load(Vector2(0,-1))
		elif dir_choice == 3 :
			brick.start_dash_load(Vector2(0,1))
		
		$Timer.wait_time = rand_range(0.05, brick.max_load_time)
		
		loading = true
		
	$Timer.start()