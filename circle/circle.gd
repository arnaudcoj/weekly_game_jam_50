extends StaticBody2D

export var scales = [[5, 1.2, 0.05], [5, .8, 0.05], [4, .5, 0.04], [2, .3, 0.02]] 
var scale_i = 0

var scaling = false

func _ready():
	$Timer.wait_time = scales[scale_i][0]
	$Timer.start()
	scaling = false

func _process(delta):
	if scaling:
		scale = scale - Vector2(1,1) * scales[scale_i][2] * delta
		if scale.x <= scales[scale_i][1]:
			stop_scaling()
			
func start_scaling():
	scaling = true
	
func stop_scaling():
	scaling = false
	scale_i += 1
	if scale_i < scales.size():
		$Timer.wait_time = scales[scale_i][0]
		$Timer.start()
		

func _on_Timer_timeout():
	start_scaling()
