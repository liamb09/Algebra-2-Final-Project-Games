extends Control

var time_list = []

func _ready():
	$Button.grab_focus()
	var score_file = File.new()
	score_file.open("res://Leaderboards/Leaderboard.txt", File.READ)
	while not score_file.eof_reached():
		var line = score_file.get_line()
		var 	times = line.get_slice('-', 1)
		time_list.append(times)
	time_list.sort()
	$VBoxContainer/Label6.text += time_list[0]

func _on_Button_pressed():
	get_tree().change_scene("res://Levels/Level1.tscn")


func _on_Button2_pressed():
	get_tree().quit()
