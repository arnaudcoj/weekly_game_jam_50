extends RigidBody2D

signal brick_dead

export var speed = 1000

var loading = false
var load_time = 0.0
var max_load_time = .3
var dash_direction = Vector2()

func die():
	emit_signal("brick_dead", self)
	queue_free()

func _process(delta):
	if loading:
		load_time += delta
		$Skin.scale = Vector2(1,1) * (1.0 - ((load_time / max_load_time) * 0.2))
		if load_time > max_load_time:
			stop_dash_load()

func _physics_process(delta):
	if loading:
		linear_velocity *= 0.95 * (1-delta)

func start_dash_load(direction):
	if not loading:
		loading = true
		load_time = 0.0
		dash_direction = direction
	
func stop_dash_load():
	if loading:
		loading = false
		$Skin.scale = Vector2(1,1)
		dash()
		load_time = 0.0

func dash():
	apply_impulse(Vector2(0,0), dash_direction * speed * ((load_time / max_load_time) * 0.8 + 0.2))
	
func is_brick():
	return true
