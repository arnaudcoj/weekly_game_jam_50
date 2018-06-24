extends Camera2D

var max_zoom = 5

onready var default_res = Vector2(ProjectSettings.get_setting("display/window/size/width"),ProjectSettings.get_setting("display/window/size/height"))

func _ready():
	get_tree().get_root().connect("size_changed",self,"on_resize")
	
func on_resize():
	var zoom = max(default_res.y/get_viewport_rect().size.y, default_res.x / get_viewport_rect().size.x)
	zoom = min(zoom, max_zoom)

	set_zoom(Vector2(zoom,zoom))