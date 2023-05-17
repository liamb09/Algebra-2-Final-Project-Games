extends Control

onready var file = "res://Leaderboards/Leaderboard.txt"
var i = 1
var highlight = Color("FFFF00")

func _ready():
	var content = read_file(file)
	write_file(file, content, Globals.player_name, str(Globals.player_time))
	var scan_content = read_file(file)
	read_to_list(file)

func read_file(file):
	var Leaderboard = File.new()
	Leaderboard.open(file, File.READ)
	var table = []
	while not Leaderboard.eof_reached():
		var line = Leaderboard.get_line()
		table.append(line)
	Leaderboard.close()
	return table

func write_file(file, content, Player, time):
	var Leaderboard = File.new()
	var index = 0 
	Leaderboard.open(file, Leaderboard.WRITE)
	for line in content:
		Leaderboard.store_string(line + "\n")
		
	Leaderboard.store_string(Player + '-' + time)
	
	Leaderboard.close()

func read_to_list(file):
	var Leaderboard = File.new()
	Leaderboard.open(file, File.READ)
	var time_list = []
	var leaderboard_dict = {}
	while not Leaderboard.eof_reached():
		var line = Leaderboard.get_line()
		var times = line.get_slice('-', 1)
		var players = line.get_slice('-', 0)
		leaderboard_dict[players] = times
		time_list.append(times)
		time_list.sort()
		#print(time_list)
		#print(leaderboard_dict)
	for time in time_list:
		var player_ind = leaderboard_dict.values().find(time)
		var player2 = leaderboard_dict.keys()[player_ind]
		var fstring = "VBoxContainer/Label%s"
		var label_path = fstring % str(i)
		var label = get_node(label_path)
		if player2 == Globals.player_name:
			label.set("custom_colors/font_color", highlight)
		if i < 10:
			label.text = "             " + str(0) + str(i) + "                                         " + player2 + "                           " + time
		else:
			label.text =  "             " + str(i) + "                                         " + player2 + "                           " + time
		i += 1
		if i >= 16:
			break
	Leaderboard.close()
	return
