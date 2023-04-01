extends Node2D

func _ready():
	$"Play Again".grab_focus()

func _on_Exit_Game_pressed():
	get_tree().quit()

func _on_Play_Again_pressed():
	get_tree().change_scene("res://PowerUps/Intro.tscn")
