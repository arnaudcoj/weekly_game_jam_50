extends Node

func _ready():
	$MenuCanvas/MainMenu.open()

func _on_start():
	$MenuCanvas/MainMenu.close()
	$LevelContainer.load_level()
	
func _on_back_to_menu():
	$LevelContainer.stop()
	$MenuCanvas/MainMenu.open()

func _on_Level_restart():
	$LevelContainer.load_level()

func _on_MainMenu_start():
	_on_start()
