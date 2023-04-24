extends Control

const DEFAULT_COLOR: Color = Color("0c7ef7")
const HIGHLIGHT_COLOR: Color = Color("ededed")

onready var option_list: Control = get_node("Options")
onready var animation_player: AnimationPlayer = get_node("AnimationPlayer")
onready var title_music: AudioStreamPlayer = get_node("AudioStreamPlayer")

onready var btn_cheat_mode: TextureButton = get_node("BtnCheatMode")

onready var credits: Control = get_node("Credits")

var selected_option: int = 0
var _is_credits_showing: bool = false


func _ready():
	_highlight_selected_option() 
	self.animation_player.play("title_sway")
	self.btn_cheat_mode.connect("pressed", self, "_enter_cheat_mode")

func _process(delta):
	if Input.is_action_just_released("ui_accept"):
		_make_selection(self.selected_option)
	if Input.is_action_just_pressed("ui_up"):
		_move_up()
		_highlight_selected_option()
	if Input.is_action_just_pressed("ui_down"):
		_move_down()
		_highlight_selected_option()

func _make_selection(n: int) -> void:
	match(n):
		0: # Play
			get_tree().change_scene("res://game/game.tscn")
		1: # Credits
			self.credits.visible = !self.credits.visible
		2: # Quit
			get_tree().quit()

func _move_up() -> void:
	if selected_option == 0:
		selected_option = 1
	else:
		selected_option -= 1

func _move_down() -> void:
	if selected_option == 1:
		selected_option = 0
	else:
		selected_option += 1

func _enter_cheat_mode() -> void:
	_make_selection(0)
	print("pressed cheat mode")

func _highlight_selected_option() -> void:
	for l in option_list.get_children():
		l.set("custom_colors/font_color", DEFAULT_COLOR)
	
	option_list.get_child(self.selected_option).set("custom_colors/font_color", HIGHLIGHT_COLOR)
