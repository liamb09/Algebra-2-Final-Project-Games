extends Node2D

var selected_level
var is_level_selected = false

func _ready():
	$Title.show()
	$LavaZoneButton.show()
	$MidnightZoneButton.show()
	$UnderwaterDeadzoneButton.show()
	$CoralReef.show()

func _on_LavaZoneButton_pressed():
	selected_level = "LavaZone"
	is_level_selected = true
	hide()
	#get_tree().change_scene("res://Main.tscn")

func _on_MidnightZoneButton_pressed():
	selected_level = "MidnightZone"
	is_level_selected = true
	hide()
	#get_tree().change_scene("res://Main.tscn")

func _on_UnderwaterDeadzoneButton_pressed():
	selected_level = "UnderwaterDeadzone"
	is_level_selected = true
	hide()
	#get_tree().change_scene("res://Main.tscn")

func _on_CoralReef_pressed():
	selected_level = "CoralReef"
	is_level_selected = true
	hide()
	#get_tree().change_scene("res://Main.tscn")
