extends Node

func _ready():
	$LevelContainer.load_level()

func _input(event):
	if event.is_action_pressed("ui_select"):
		get_tree().paused = !get_tree().paused

func _on_Level_restart():
	$LevelContainer.load_level()
