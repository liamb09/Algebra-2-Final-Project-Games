extends Node2D
class_name Difficulty

func _ready():
	$Beginner.grab_focus()

func _on_Experienced_pressed():
	get_tree().change_scene("res://Level.tscn")


func _on_Beginner_pressed():
	var pressed = true
	get_tree().change_scene("res://Level.tscn")
	return pressed

func _on_Back_pressed():
	get_tree().change_scene("res://PowerUps/Intro.tscn")

func speed_change(pressed):
	if pressed == true:
		var speed = 1000

