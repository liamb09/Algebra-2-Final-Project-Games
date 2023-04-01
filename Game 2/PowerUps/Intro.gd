extends Node2D
var delay = 0

func _ready():
	$Button.grab_focus()

func _on_Button_pressed():
	get_tree().change_scene("res://Difficulty.tscn")

func _on_Button3_pressed():
	get_tree().quit()


func _on_Button4_pressed():
	get_tree().change_scene("res://PowerUps/Tutorial Choice.tscn")

func _on_Button2_pressed():
	pass # Replace with function body.
