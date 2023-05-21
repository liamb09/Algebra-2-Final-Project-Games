extends Node2D

var selected_level
var is_level_selected = false
var default_button_text
var buttons

func _ready():
	show()
	focus_button()
	buttons = get_tree().get_nodes_in_group("Buttons")
	default_button_text = [$Buttons/LavaZoneButton.text, $Buttons/MidnightZoneButton.text, $Buttons/UnderwaterDeadzoneButton.text, $Buttons/CoralReef]

func focus_button():
	$Buttons/LavaZoneButton.grab_focus()

func _process(delta):
	for button in buttons.slice(1, 5):
		if button.has_focus():
			if button.text[0] != "-":
				button.set_text("- " + button.text + " -")
		else:
			if button.text[0] == "-":
				button.set_text(button.text.substr(2,button.text.length()-4))

func _on_LavaZoneButton_pressed():
	selected_level = "LavaZone"
	is_level_selected = true
	hide()

func _on_MidnightZoneButton_pressed():
	selected_level = "MidnightZone"
	is_level_selected = true
	hide()

func _on_UnderwaterDeadzoneButton_pressed():
	selected_level = "UnderwaterDeadzone"
	is_level_selected = true
	hide()

func _on_CoralReef_pressed():
	selected_level = "CoralReef"
	is_level_selected = true
	hide()

func _on_Quit_pressed():
	get_tree().quit()
