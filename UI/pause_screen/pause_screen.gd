extends Control

var open = false

func open():
	open = true
	show()
	
func close():
	open = false
	hide()