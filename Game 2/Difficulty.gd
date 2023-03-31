extends Node2D



func _on_Experienced_pressed():
	get_tree().change_scene("res://Level.tscn")


func _on_Beginner_pressed():
	pass # Replace with function body.


func _on_Back_pressed():
	get_tree().change_scene("res://PowerUps/Intro.tscn")
