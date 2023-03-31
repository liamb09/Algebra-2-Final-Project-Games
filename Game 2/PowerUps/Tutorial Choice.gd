extends Node2D

func _on_Button_pressed():
	get_tree().change_scene("res://1 Player Tut.tscn")


func _on_Button2_pressed():
	get_tree().change_scene("res://2 Player Tut.tscn")

func _on_Return_pressed():
	get_tree().change_scene("res://PowerUps/Intro.tscn")
