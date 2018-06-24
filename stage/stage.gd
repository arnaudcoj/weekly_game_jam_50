extends Node2D

signal restart

func _ready():
	pass
	
func _input(event):
	if event.is_action_pressed("ui_select"):
		get_tree().paused = !get_tree().paused

func _on_Bricks_brick_dead(dead_brick):
	#2 because the 2nd has not been freed yet
	if $GameObjects/Bricks.get_remaining_bricks_count() == 2:
		$GameObjects/Ball.queue_free()
		#temporarly remove the ball to indicate we won
		$GameOverTimer.start()

func game_over():
	emit_signal("restart")
	

func _on_GameOverTimer_timeout():
	game_over()
