extends Node2D

const START_DELAY: int = 3
const FALLING_Y_POS: int = 132
const GAME_LENGTH: int = 60


onready var player: Player = get_node("Player")
onready var kill_zone: Area2D = get_node("KillZone")
onready var kill_zone1: Area2D = get_node("KillZone2")
onready var kill_zone2: Area2D = get_node("KillZone3")
onready var effect_conatainer: EffectContainer = get_node("EffectContainer")
onready var gamer_timer: Timer = get_node("GameTimer")
onready var hazard_manager: HazardManager = get_node("HazardManager")
onready var start_delay_timer: Timer = get_node("StartDelay")
onready var gameover_sound: AudioStreamPlayer = get_node("GameOverSound")
onready var off_screen_pos: Position2D = get_node("OffScreenPos")
onready var player_spawn_point: Position2D = get_node("PlayerSpawnPoint")
onready var background_music: AudioStreamPlayer = get_node("BackgroundMusic")
onready var lbl_time_left: Label = get_node("HUD/LblTimeLeft")

onready var manager_death_marker: DeathMarkerManager = $DeathMarkerManager

var is_game_over: bool = false
var seconds_in: int
var player_attempts: int
var has_finished_once: bool = false
var _time_left: int
var beaten = false

func _ready():
	self.player_attempts = 0
	self._connection_child_signals() 
	self._set_up_new_game()

func _physics_process(delta):
	if Input.is_action_pressed("quit"):
		get_tree().quit()

func _set_up_new_game() -> void:
	self.player.is_freezable = true
	self._time_left = GAME_LENGTH
	self.lbl_time_left.visible = true
	self.player_attempts += 1
	self._update_time_left_label()
	self._update_attempt_counter(player_attempts)
	self.seconds_in = 0
	self._hide_overlay_items()
	self.is_game_over = false
	self.player.reset_player()
	self._spawn_player()
	self.start_delay_timer.start(START_DELAY)
	self._start_level()

func _spawn_player() -> void:
	self.player.global_position = self.player_spawn_point.global_position

func _hide_overlay_items() -> void:
	for c in $OverLay.get_children():
		c.visible = false

func _input(event):
	if self.is_game_over:
		if event.is_action_released("jump"):
			self._restart_game()

func _restart_game() -> void:
	self._set_up_new_game()

func _update_attempt_counter(n: int) -> void:
	$HUD/LblAttempt.text = str("Attempt: ", n)

func _start_level() -> void:
	if !is_game_over: # Prevents crashing if player jumps of level before game starts
		self.gamer_timer.stop()
		self.gamer_timer.start(1)
		self.hazard_manager.start_timers()

func _on_player_falling(_body: Node) -> void:
	if _body.has_method("take_damage"):
		self._end_game(Vector2(_body.global_position.x, FALLING_Y_POS))
		self.player.is_alive = false
		_body.take_damage()

func _update_time_left_label() -> void:
	self.lbl_time_left.text = str(self._time_left)
	
func _tick() -> void:
	if !is_game_over:
		self._time_left -= 1
		self._update_time_left_label()
		self.seconds_in += 1
		self.hazard_manager.spawn_hazard(self.seconds_in)
		$DEBUG/Label.text = str("Sec #", seconds_in)

func _remove_hazards() -> void:
	self.hazard_manager.reset_self()

func _connection_child_signals() -> void:
	self.start_delay_timer.connect("timeout", self, "_start_level")
	###self.player.connect("fell_off_screen", self, "_on_player_falling")
	self.player.connect("is_dying", self, "_remove_hazards")
	# TODO: REMOVE ONCE I ADD SOUND
	#### self.player.connect("on_death", self, "_play_gameoever_sound")
	self.player.connect("on_death", self, "_end_game")
	self.kill_zone.connect("body_entered", self, "_on_player_falling")
	self.kill_zone1.connect("body_entered", self, "_on_player_falling")
	self.kill_zone2.connect("body_entered", self, "_on_player_falling")
	self.player.connect("on_air_jump", self.effect_conatainer, "add_effect_to_screen")
	self.gamer_timer.connect("timeout", self, "_tick")
	self.gameover_sound.connect("finished", self, "_end_game")
	self.hazard_manager.connect("player_finished", self, "_game_won")

func _play_gameoever_sound(_pos: Vector2) -> void:

	self.is_game_over = true
	#######  $DeathMarkerContainer.add_marker_to_screen(_pos)
	self.player.global_position = self.off_screen_pos.global_position
	gameover_sound.play()

func _end_game(_pos: Vector2):
	# Play gameover sound
	
	self.is_game_over = true
	$DeathMarkerManager.add_marker_to_screen(_pos)
	self.player.global_position = self.off_screen_pos.global_position
	self._remove_hazards()
	if beaten == false:
		$OverLay/LblRestart.visible = true
		print('gameover')

func _game_won() -> void:
	self.player.is_freezable = false
	self.gamer_timer.stop()
	self.lbl_time_left.visible = false
	# play winning sound
	$OverLay/LblWin.visible = true
	beaten = true
	print('You win!')
