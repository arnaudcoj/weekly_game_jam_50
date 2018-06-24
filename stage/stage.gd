extends Node2D

signal restart

var game_over = false
	
func _input(event):
	if event.is_action_pressed("ui_select"):
		_on_pause()
	elif game_over and event is InputEventKey:
		_on_game_over_restart()

func _on_Bricks_brick_dead(dead_brick):
	#2 because the 2nd has not been freed yet
	if $GameObjects/Bricks.get_remaining_bricks_count() == 2:
		game_over()

func game_over():
	game_over = true
	#temporarly remove the ball to indicate we won
	$GameObjects/Ball.queue_free()
	$CanvasLayer/GameOverScreen.set_winner($GameObjects/Bricks.get_winner().name)
	$CanvasLayer/GameOverScreen.open()

func _on_game_over_restart():
	game_over = false
	$CanvasLayer/GameOverScreen.close()
	emit_signal("restart")

func _on_pause():		
	get_tree().paused = !get_tree().paused
	if get_tree().paused:
		$CanvasLayer/PauseScreen.open()
	else:
		$CanvasLayer/PauseScreen.close()