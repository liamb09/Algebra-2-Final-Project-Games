extends Node2D

var max_lives = 5
var player1points = max_lives
var player2points = max_lives
var current_map
var playing = false
var won = false

func setup():
	show()
	current_map = LevelSelection.selected_level
	$MidnightZone.collision_layer = 0
	$MidnightZone.collision_mask = 0
	$LavaZone.collision_layer = 0
	$LavaZone.collision_mask = 0
	$UnderwaterDeadzone.collision_layer = 0
	$UnderwaterDeadzone.collision_mask = 0
	$CoralReef.collision_layer = 0
	$CoralReef.collision_mask = 0
	$LavaZone.hide()
	$MidnightZone.hide()
	$UnderwaterDeadzone.hide()
	$CoralReef.hide()
	$WinMessage.bbcode_text = ""
	$PointDisplay.animation = "purple"
	$PointDisplay2.animation = "green"
	if current_map == "LavaZone":
		$Backgrounds.frame = 2
		$LavaZone.show()
		$LavaZone.collision_layer = 1
		$LavaZone.collision_mask = 1
		set_pos_and_scale($P2Goal1, Vector2(640, 1043), Vector2(16, 0.75))
		set_pos_and_scale($P2Goal2, Vector2(640, 4), Vector2(16, 0.75))
		set_pos_and_scale($P1Goal1, Vector2(1280, 1043), Vector2(16, 0.75))
		set_pos_and_scale($P1Goal2, Vector2(1280, 4), Vector2(16, 0.75))
		set_player_and_ball(Vector2(300, 992), Vector2(1620, 992), Vector2(960, 320))
		$PointDisplay.position = Vector2(32, 592)
		$PointDisplay.rotation_degrees = 0
		$PointDisplay2.position = Vector2(1888, 592)
		$PointDisplay2.rotation_degrees = 0
	elif current_map == "MidnightZone":
		$Backgrounds.frame = 3
		$MidnightZone.show()
		$MidnightZone.collision_layer = 1
		$MidnightZone.collision_mask = 1
		set_pos_and_scale($P2Goal1, Vector2(890, 576), Vector2(8, 3))
		set_pos_and_scale($P2Goal2, Vector2(10, 96), Vector2(8, 0.5))
		set_pos_and_scale($P1Goal1, Vector2(1030, 576), Vector2(8, 3))
		set_pos_and_scale($P1Goal2, Vector2(1910, 96), Vector2(8, 0.5))
		set_player_and_ball(Vector2(300, 540), Vector2(1620, 540), Vector2(960, 200))
		$PointDisplay.position = Vector2(32, 241)
		$PointDisplay.rotation_degrees = 180
		$PointDisplay2.position = Vector2(1888, 241)
		$PointDisplay2.rotation_degrees = 180
	elif current_map == "UnderwaterDeadzone":
		$Backgrounds.frame = 1
		$UnderwaterDeadzone.show()
		$UnderwaterDeadzone.collision_layer = 1
		$UnderwaterDeadzone.collision_mask = 1
		set_pos_and_scale($P2Goal1, Vector2(4000, 576), Vector2(8, 3))
		set_pos_and_scale($P2Goal2, Vector2(10, 540), Vector2(8, 10))
		set_pos_and_scale($P1Goal1, Vector2(4000, 576), Vector2(8, 3))
		set_pos_and_scale($P1Goal2, Vector2(1910, 540), Vector2(8, 10))
		set_player_and_ball(Vector2(200, 540), Vector2(1720, 540), Vector2(960, 200))
		$PointDisplay.position = Vector2(208, 33)
		$PointDisplay.rotation_degrees = -90
		$PointDisplay2.position = Vector2(1712, 33)
		$PointDisplay2.rotation_degrees = 90
	elif current_map == "CoralReef":
		$Backgrounds.frame = 0
		$CoralReef.show()
		$CoralReef.collision_layer = 1
		$CoralReef.collision_mask = 1
		set_pos_and_scale($P2Goal1, Vector2(4000, 576), Vector2(8, 3))
		set_pos_and_scale($P2Goal2, Vector2(20, 540), Vector2(8, 10))
		set_pos_and_scale($P1Goal1, Vector2(4000, 576), Vector2(8, 3))
		set_pos_and_scale($P1Goal2, Vector2(1900, 540), Vector2(8, 10))
		set_player_and_ball(Vector2(550, 672), Vector2(1370, 672), Vector2(960, 200))
		$PointDisplay.position = Vector2(432, 33)
		$PointDisplay.rotation_degrees = 90
		$PointDisplay2.position = Vector2(1488, 33)
		$PointDisplay2.rotation_degrees = -90
	$Ball.reset()

func _ready():
	hide()

func _process(delta):
	if LevelSelection.is_level_selected:
		setup()
		LevelSelection.is_level_selected = false
	if player1points > 0 and player2points > 0:
		$PointDisplay.show()
		$PointDisplay2.show()
		$PointDisplay.frame = 5 - player2points
		$PointDisplay2.frame = 5 - player1points
	elif not won:
		won = true
		$PointDisplay.hide()
		$PointDisplay2.hide()
		if player1points == 0:
			$WinMessage.bbcode_text = "            Player 1 Wins!\nPlayer 2 got DOMINATED!"
		else:
			$WinMessage.bbcode_text = "            Player 2 Wins!\nPlayer 1 got DOMINATED!"
		$Timer.start()
	if Input.is_action_pressed("P1Quit") and Input.is_action_pressed("P2Quit"):
		$Ball.reset()
		$Ball.linear_velocity = Vector2.ZERO

func set_pos_and_scale(goal, pos, scale):
	goal.position = pos
	goal.scale = scale

func set_player_and_ball(player2_pos, player1_pos, ball_pos):
	$Player2.position = player2_pos
	$Player.position = player1_pos
	$Ball.start_pos = ball_pos

func _on_Goal_body_entered(body):
	if body.get_name() == "Ball":
		player1points -= 1
		$Ball.reset()
		$Ball.linear_velocity = Vector2.ZERO


func _on_Goal2_body_entered(body):
	if body.get_name() == "Ball":
		player2points -= 1
		$Ball.reset()
		$Ball.linear_velocity = Vector2.ZERO


func _on_FadeBox_unpause():
	
	player1points = max_lives
	player2points = max_lives
	won = false
	hide()
	LevelSelection.show()
	LevelSelection.focus_button()

func _on_Timer_timeout():
	get_tree().paused = true
