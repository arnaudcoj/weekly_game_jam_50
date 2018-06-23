extends RigidBody2D

signal brick_dead

export var speed = 800
export var human = false

var velocity = Vector2()

func _ready():
	if !human:
		$Timer.wait_time = rand_range(.2, 5.0)
		$Timer.start()

func _process(delta):
	if human:
		human_control()
	
func human_control():
	if Input.is_action_just_pressed("ui_right"):
		apply_impulse(Vector2(0,0), Vector2(speed,0))
	if Input.is_action_just_pressed("ui_left"):
		apply_impulse(Vector2(0,0), Vector2(-speed,0))
	if Input.is_action_just_pressed("ui_up"):
		apply_impulse(Vector2(0,0), Vector2(0,-speed))
	if Input.is_action_just_pressed("ui_down"):
		apply_impulse(Vector2(0,0), Vector2(0,speed))
		
func _on_Timer_timeout():
	if !human:
		var dir_choice = randi() % 4
		
		if dir_choice == 0 :
			apply_impulse(Vector2(0,0), Vector2(speed,0))
		elif dir_choice == 1 :
			apply_impulse(Vector2(0,0), Vector2(-speed,0))
		elif dir_choice == 2 :
			apply_impulse(Vector2(0,0), Vector2(0,-speed))
		elif dir_choice == 3 :
			apply_impulse(Vector2(0,0), Vector2(0,speed))
		
		$Timer.wait_time = rand_range(1.0, 5.0)
		$Timer.start()

func die():
	emit_signal("brick_dead", self)
	queue_free()
	
func is_brick():
	return true
