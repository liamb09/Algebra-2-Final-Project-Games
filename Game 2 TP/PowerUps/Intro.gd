extends Node2D
var delay = 0

func _on_Button3_pressed():
	get_tree().quit()

func _on_Button2_pressed():
	get_tree().change_scene("res://Level.tscn")
