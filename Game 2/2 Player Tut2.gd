extends Node2D

func _ready():
	$Back.grab_focus()

func _on_Back_pressed():
	get_tree().change_scene("res://2 Player Tut.tscn")
