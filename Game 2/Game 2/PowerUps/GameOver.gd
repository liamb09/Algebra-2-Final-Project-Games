extends CanvasLayer

func _on_Restart_pressed():
	get_tree().change_scene("res://Level.tscn")

func _on_Quit_pressed():
	get_tree().quit()
