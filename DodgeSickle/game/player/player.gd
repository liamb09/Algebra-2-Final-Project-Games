class_name Player
extends KinematicBody2D


signal on_air_jump(effect, pos)
signal is_dying
signal on_death(dying_pos)


const UP_DIRECTION: Vector2 = Vector2.UP
const p_JumpEffect: PackedScene = preload("res://game/player/jump_effect.tscn")

onready var animated_sprite: AnimatedSprite = get_node("AnimatedSprite")
onready var standing_still_timer: Timer = get_node("StandingStillTimer")

onready var animation_player: AnimationPlayer = get_node("AnimationPlayer")
onready var hitbox: CollisionPolygon2D = get_node("CollisionShape")

var velocity: Vector2 = Vector2.ZERO
var speed: float =  130.0
var acceleration: float = 0.2

# TODO: Add two types of friction 1.0 for normal and 0.03 for "on ice"
var friction: float = 0.1
var gravity: float = 1200.0
var horizontal_direction: int



var jump_timer = 0
export var max_jump_time = 0.3


var is_freezable: bool = true
var jumps: int = 0
var jump_strength: float =  350.0
var max_jumps: int = 1
var jumps_left = 0
var extra_jump_strength: float = 230.0

var is_dashing: bool = false
var is_grounded: bool
var is_alive: bool = true
var is_on_ice: bool
var idle_time_max: int = 5.5
var is_idle: bool

func _ready():
	hitbox.set_deferred("disabled", true)
	_reset_collsion_shape()
	animated_sprite.play("default")
	animated_sprite.connect("animation_finished", self, "_animation_finished")
	standing_still_timer.connect("timeout", self, "_on_frozen")
	animation_player.connect("animation_finished", self, "_animation_player_finished")

func _reset_collsion_shape() -> void:
	$AnimatedSprite.modulate.a = 1.00
	hitbox.set_deferred("disabled", false)
	
func _lower_collsion_shape() -> void:
	$AnimatedSprite.modulate.a = 0.50
	hitbox.set_deferred("disabled", true)

func _process(delta):
	if self.is_alive:
		if Input.is_action_pressed("move_left") || Input.is_action_pressed("move_right") || Input.is_action_pressed("jump"):
			if !self.standing_still_timer.is_stopped():
				self.standing_still_timer.stop()
		else:
			if self.standing_still_timer.is_stopped():
				self.standing_still_timer.start(idle_time_max)
			else:
				pass

func _physics_process(delta: float) -> void:
	
	
	if self.is_alive:
		self.horizontal_direction = (Input.get_action_strength("move_right") - Input.get_action_strength("move_left"))
		if better_is_on_floor(): 
			if !is_grounded:
				reset_jumps()
			is_grounded = true
		else: 
			is_grounded = false
		
		
		
		
		
		
		
		# Handle jumping

	
		
		
		
		
		
		if better_is_on_floor():
			jump_timer = 0
			jumps_left = self.max_jumps
		else:
			jump_timer += delta

		if Input.is_action_just_pressed("jump") and (jumps_left > 0 or jump_timer < max_jump_time):
			if not better_is_on_floor():
				jumps_left -= 1
				velocity.y = -extra_jump_strength
				_lower_collsion_shape()
				$AnimationPlayer.play("flip")
				self.emit_signal("on_air_jump", p_JumpEffect, $Position2D.global_position)
			else:
				velocity.y = -jump_strength * (1.0 - jump_timer / max_jump_time)
#			else:
#				if jumps >= 1 and jumps <= max_jumps:
#					_lower_collsion_shape()
#					$AnimationPlayer.play("flip")
#					velocity.y = -extra_jump_strength
#					self.emit_signal("on_air_jump", p_JumpEffect, $Position2D.global_position)
#					jumps += 1
		elif Input.is_action_just_released("jump") and velocity.y < 0:
			velocity.y *= 0.5
		
		
		
		
		
		
		
		
#		if Input.is_action_just_pressed("jump"):
#			if jumps == 0:
#				jumps += 1
#				velocity.y = -jump_strength
#			else:
#				if jumps >= 1 and jumps <= max_jumps:
#					_lower_collsion_shape()
#					$AnimationPlayer.play("flip")
#					velocity.y = -extra_jump_strength
#					self.emit_signal("on_air_jump", p_JumpEffect, $Position2D.global_position)
#					jumps += 1
	
		if self.horizontal_direction != 0: 
			velocity.x = lerp(velocity.x, self.horizontal_direction * speed, acceleration)
		elif self.horizontal_direction == 0: 
			velocity.x = lerp(velocity.x, self.horizontal_direction * speed, friction)
		
		velocity.y += gravity * delta
		velocity = move_and_slide(velocity, UP_DIRECTION)
		
		if self.horizontal_direction > 0:
			animated_sprite.flip_h = false
		elif self.horizontal_direction < 0:
			animated_sprite.flip_h = true

func better_is_on_floor() -> bool:
	var arr: Array =[]
	if self.is_on_floor():
		if arr.size() <= 4:
			arr.append(true)
	return arr.has(true)

func _start_standing_still_timer() -> void:
	print("starting timmer")
	self.standing_still_timer.start(self.idle_time_max)

func reset_jumps() -> void:
	self.jumps = 0

func _on_frozen() -> void:
	if self.is_alive and self.is_freezable:
		print("player froze")
		take_damage()

func take_damage():
	if self.is_alive:
		print('brrrr')
		self.is_alive = false
		emit_signal("is_dying")
		_play_death_animation()
		print("dying")

func _play_death_animation() -> void:
	print('player is dead')
	# Play animation
	animated_sprite.play("dying")

func reset_player() -> void:
	self.velocity = Vector2.ZERO
	self.standing_still_timer.stop()
	self.is_alive = true
	self.animated_sprite.play("default")

func _animation_player_finished(ani_name: String) -> void:
	if ani_name == "flip":
		_reset_collsion_shape()

func _animation_finished():
	if animated_sprite.animation == "dying":
		emit_signal("on_death", self.global_position)
		####  self.queue_free()
		
