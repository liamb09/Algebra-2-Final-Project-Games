extends Control

var Bad_words = ["ass", "fag", "dik", "nig", "fuk", "ngr", "sex", "fuc", "cum", "cp", "tit", "jug"]

func key_press(character):
	if len($Label.text) < 3:
		$Label.text += str(character)
		print($Label.text,$VBoxContainer/GridContainer/Button1)
	else:
		pass

func _ready():
	$VBoxContainer/GridContainer/Button1.grab_focus()
	

func _on_Button1_pressed():
	key_press('q')

func _on_Button2_pressed():
	key_press('w')


func _on_Button3_pressed():
	key_press('e')


func _on_Button4_pressed():
	key_press('r')


func _on_Button5_pressed():
	key_press('t')


func _on_Button6_pressed():
	key_press('y')


func _on_Button7_pressed():
	key_press('u')


func _on_Button8_pressed():
	key_press('i')


func _on_Button9_pressed():
	key_press('o')


func _on_Button10_pressed():
	key_press('p')


func _on_Button11_pressed():
	key_press('a')


func _on_Button12_pressed():
	key_press('s')


func _on_Button13_pressed():
	key_press('d')


func _on_Button14_pressed():
	key_press('f')


func _on_Button15_pressed():
	key_press('_')


func _on_Button16_pressed():
	key_press('g')


func _on_Button17_pressed():
	key_press('h')

func _on_Button18_pressed():
	key_press('j')


func _on_Button19_pressed():
	key_press('k')


func _on_Button20_pressed():
	key_press('l')


func _on_Button21_pressed():
	$Label.text = $Label.text.left(len($Label.text)-1)
	


func _on_Button22_pressed():
	key_press('z')


func _on_Button23_pressed():
	key_press('x')


func _on_Button24_pressed():
	key_press('c')


func _on_Button25_pressed():
	key_press('v')


func _on_Button26_pressed():
	key_press('b')


func _on_Button27_pressed():
	key_press('n')


func _on_Button28_pressed():
	key_press('m')


func _on_Button_pressed():
	Globals.player_name = $Label.text
	if Globals.player_name in Bad_words:
		$Label.text = ""
		Globals.player_name = ""
	else:
		get_tree().change_scene("res://Leaderboard.tscn")
