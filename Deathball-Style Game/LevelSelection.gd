extends Node2D

var selected_level

func _ready():
	pass # Replace with function body.

func _on_LavaZoneButton_pressed():
	selected_level = "LavaZone"
	get_tree().change_scene("res://Main.tscn")


func _on_MidnightZoneButton_pressed():
	selected_level = "MidnightZone"
	get_tree().change_scene("res://Main.tscn")


func _on_UnderwaterDeadzoneButton_pressed():
	selected_level = "UnderwaterDeadzone"
	get_tree().change_scene("res://Main.tscn")

func _on_CoralReef_pressed():
	selected_level = "CoralReef"
	get_tree().change_scene("res://Main.tscn")
