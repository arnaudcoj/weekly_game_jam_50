extends RigidBody2D

export var speed = 500
export var human = false

var velocity = Vector2()

func _ready():
	pass

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