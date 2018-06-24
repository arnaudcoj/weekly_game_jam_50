extends Control

signal start

var open = false

func _input(event):
	if open and event is InputEventKey:
		emit_signal("start")

func open():
	open = true
	show()
	
func close():
	open = false
	hide()