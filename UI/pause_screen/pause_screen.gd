extends Control

var open = false

func open():
	open = true
	show()
	
func close():
	open = false
	hide()
	
func set_winner(winner_name):
	$Label.text = winner_name + " is the last brick standing!"