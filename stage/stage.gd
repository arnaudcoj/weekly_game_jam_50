extends Node2D

signal restart

var game_over = false
	
func _input(event):
	if event.is_action_pressed("ui_select"):
		_on_pause()

func _on_Bricks_brick_dead(dead_brick):
	#2 because the 2nd has not been freed yet
	if $GameObjects/Bricks.get_remaining_bricks_count() == 2:
		game_over()

func game_over():
	game_over = true
	$GameObjects/Ball.queue_free()
	#temporarly remove the ball to indicate we won
	$GameOverTimer.start()

func _on_GameOverTimer_timeout():
	game_over = false
	emit_signal("restart")

func _on_pause():
	if game_over:
		return
		
	get_tree().paused = !get_tree().paused
	if get_tree().paused:
		$CanvasLayer/PauseScreen.open()
	else:
		$CanvasLayer/PauseScreen.close()