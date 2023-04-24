class_name HazardManager
extends Node2D

signal player_finished

onready var hazard_container: Node2D = get_node("HazardContainer")
onready var single_sickle_left_timer: Timer = get_node("SickleLeft")
onready var single_sickle_right_timer: Timer = get_node("SickleRight")

onready var bottom_left: Position2D = get_node("LeftLow")
onready var bottom_right: Position2D = get_node("RightLow")

const p_IceSickle: PackedScene = preload("res://game/danger_object/ice_sickle/ice_sickle.tscn")

const p_SWTopLeft: PackedScene = preload("res://game/danger_object/wave/sickle_wave_top_left.tscn")
const p_SWTopRight: PackedScene = preload("res://game/danger_object/wave/sickle_wave_top_right.tscn")
const p_SWTopAll: PackedScene = preload("res://game/danger_object/wave/sickle_wave_top_all.tscn")

const p_SWLeftTop: PackedScene = preload("res://game/danger_object/wave/sickle_wave_left_top.tscn")
const p_SWLeftBottom: PackedScene = preload("res://game/danger_object/wave/sickle_wave_left_bottom.tscn")
const p_SWLeftAll: PackedScene = preload("res://game/danger_object/wave/sickle_wave_left_all.tscn")

const p_SWRightTop: PackedScene = preload("res://game/danger_object/wave/sickle_wave_right_top.tscn")
const p_SWRightBottom: PackedScene = preload("res://game/danger_object/wave/sickle_wave_right_bottom.tscn")

const p_SWFinal: PackedScene = preload("res://game/danger_object/wave/sickle_wave_final.tscn")

#TODO: Make const 
var left_timer_time: int = 4
var right_timer_time: float = 2.0

func _ready():
	single_sickle_left_timer.connect("timeout", self, "_on_left_timeout")
	single_sickle_right_timer.connect("timeout", self, "_on_right_timeout")

func start_timers() -> void:
	single_sickle_right_timer.start(right_timer_time)
	single_sickle_left_timer.start(left_timer_time)

func _spawn_ice_sickle(spawn_pos: Vector2 = $L4.global_position, move_dir: int = 0, speed = 60) -> void:
	var new_sickle: DangerObject = p_IceSickle.instance()
	new_sickle.speed = speed
	new_sickle.rotation_d = move_dir
	new_sickle.global_position = spawn_pos
	self.hazard_container.call_deferred("add_child", new_sickle)

func reset_self() -> void:
	for c in self.hazard_container.get_children():
		c.call_deferred("queue_free")
		self._stop_timers()

func _stop_timers() -> void:
	single_sickle_left_timer.stop()
	single_sickle_right_timer.stop()

func _spawn_wave(wave_type: PackedScene, speed: int = 100) -> void:
	var new_wave: SickleWave = wave_type.instance()
	new_wave.set_sickle_speed(speed)
	self.hazard_container.call_deferred("add_child", new_wave)

func _on_left_timeout() -> void:
	_spawn_ice_sickle($LeftJump.global_position, DangerObject.MOVING_DIRECTION.RIGHT, 120)
	_spawn_ice_sickle($LeftLow.global_position, DangerObject.MOVING_DIRECTION.RIGHT, 170)
	## _spawn_ice_sickle(bottom_left.global_position, DangerObject.MOVING_DIRECTION.RIGHT, 150)

func _on_right_timeout() -> void:
	_spawn_ice_sickle($RightLow.global_position, DangerObject.MOVING_DIRECTION.LEFT, 140)
	## _spawn_ice_sickle(bottom_right.global_position, DangerObject.MOVING_DIRECTION.LEFT, 70)

func spawn_hazard(sec: int) -> void:
	match sec:
		2:
			_spawn_wave(p_SWTopLeft, 100)
		4:
			_spawn_wave(p_SWTopRight, 80)
		6:
			_spawn_wave(p_SWLeftBottom, 120)
		8:
			_spawn_wave(p_SWLeftAll, 130)
		10:
			_spawn_wave(p_SWLeftTop, 80)
		12:
			pass
		14: 
			_stop_timers()
		16:
			start_timers()
			_spawn_wave(p_SWTopRight, 150)
			_spawn_wave(p_SWLeftBottom, 100)
		18:
			_spawn_wave(p_SWTopAll, 120)
		20:
			_spawn_wave(p_SWTopLeft, 200)
		22:
			_spawn_wave(p_SWLeftBottom, 180)
		24:
			_spawn_wave(p_SWLeftBottom, 175)
		26:
			_spawn_wave(p_SWTopAll, 110)
		28:
			_spawn_wave(p_SWRightTop)
		30:
			_spawn_wave(p_SWLeftAll)
		32:
			_spawn_wave(p_SWTopAll, 70)
		34:
			pass
			#_spawn_wave(p_SWTopAll, 90)
		35:
			_spawn_wave(p_SWTopAll, 110)

		36:
			_stop_timers()
		38:
			start_timers()
			_spawn_wave(p_SWLeftBottom, 100)
		40:
			_spawn_wave(p_SWRightTop, 130)
		42:
			pass
		44:
			_spawn_wave(p_SWRightBottom)
		46:
			pass
			
		48:
			pass
		50:
			pass
		52:
			pass
		54:
			pass
		56:
			_spawn_wave(p_SWFinal)
		58:
			pass
		60:
			# End of game
			_stop_timers()
			emit_signal("player_finished")
