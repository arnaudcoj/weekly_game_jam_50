extends Node

var stage1 = preload("res://stage/stage1.tscn")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func load_level():
	stop()
	
	var new_stage = stage1.instance()
	
	new_stage.connect("restart", self, "load_level")
	
	add_child(new_stage)
	
func stop():
	for child in get_children():
		child.queue_free()