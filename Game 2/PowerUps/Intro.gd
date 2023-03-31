extends Node2D
var delay = 0

func _on_Button_pressed():
	get_tree().change_scene("res://Level.tscn")

func _on_Button3_pressed():
	get_tree().quit()
