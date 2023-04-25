extends Node2D

export var player1points = 5
export var player2points = 5
var current_map

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
	if current_map == "LavaZone":
		$LavaZone.show()
		$LavaZone.collision_layer = 1
		$LavaZone.collision_mask = 1
		set_pos_and_scale($P2Goal1, Vector2(640, 1043), Vector2(16, 0.75))
		set_pos_and_scale($P2Goal2, Vector2(640, 4), Vector2(16, 0.75))
		set_pos_and_scale($P1Goal1, Vector2(1280, 1043), Vector2(16, 0.75))
		set_pos_and_scale($P1Goal2, Vector2(1280, 4), Vector2(16, 0.75))
		set_player_and_ball(Vector2(300, 992), Vector2(1620, 992), Vector2(960, 320))
		$PointDisplay.position = Vector2(1888, 337)
		$PointDisplay.rotation_degrees = 0
		$PointDisplay2.position = Vector2(32, 337)
		$PointDisplay2.rotation_degrees = 0
	elif current_map == "MidnightZone":
		$MidnightZone.show()
		$MidnightZone.collision_layer = 1
		$MidnightZone.collision_mask = 1
		set_pos_and_scale($P2Goal1, Vector2(928, 576), Vector2(8, 3))
		set_pos_and_scale($P2Goal2, Vector2(20, 96), Vector2(8, 0.5))
		set_pos_and_scale($P1Goal1, Vector2(992, 576), Vector2(8, 3))
		set_pos_and_scale($P1Goal2, Vector2(1900, 96), Vector2(8, 0.5))
		set_player_and_ball(Vector2(300, 540), Vector2(1620, 540), Vector2(960, 200))
		$PointDisplay.position = Vector2(1888, 337)
		$PointDisplay.rotation_degrees = 0
		$PointDisplay2.position = Vector2(32, 337)
		$PointDisplay2.rotation_degrees = 0
	elif current_map == "UnderwaterDeadzone":
		$UnderwaterDeadzone.show()
		$UnderwaterDeadzone.collision_layer = 1
		$UnderwaterDeadzone.collision_mask = 1
		set_pos_and_scale($P2Goal1, Vector2(4000, 576), Vector2(8, 3))
		set_pos_and_scale($P2Goal2, Vector2(20, 540), Vector2(8, 10))
		set_pos_and_scale($P1Goal1, Vector2(4000, 576), Vector2(8, 3))
		set_pos_and_scale($P1Goal2, Vector2(1900, 540), Vector2(8, 10))
		set_player_and_ball(Vector2(200, 540), Vector2(1720, 540), Vector2(960, 200))
		$PointDisplay.position = Vector2(1760, 33)
		$PointDisplay.rotation_degrees = -90
		$PointDisplay2.position = Vector2(160, 33)
		$PointDisplay2.rotation_degrees = 90
	elif current_map == "CoralReef":
		$CoralReef.show()
		$CoralReef.collision_layer = 1
		$CoralReef.collision_mask = 1
		set_pos_and_scale($P2Goal1, Vector2(4000, 576), Vector2(8, 3))
		set_pos_and_scale($P2Goal2, Vector2(20, 540), Vector2(8, 10))
		set_pos_and_scale($P1Goal1, Vector2(4000, 576), Vector2(8, 3))
		set_pos_and_scale($P1Goal2, Vector2(1900, 540), Vector2(8, 10))
		set_player_and_ball(Vector2(550, 672), Vector2(1370, 672), Vector2(960, 200))
		$PointDisplay.position = Vector2(1488, 33)
		$PointDisplay.rotation_degrees = -90
		$PointDisplay2.position = Vector2(432, 33)
		$PointDisplay2.rotation_degrees = 90

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
	else:
		$PointDisplay.hide()
		$PointDisplay2.hide()
		if player1points == 0:
			$WinMessage.bbcode_text = "    Player 2 Wins!\nPlayer 1 got DOMINATED!!"
		else:
			$WinMessage.bbcode_text = "    Player 1 Wins!\nPlayer 2 got DOMINATED!!"

func set_pos_and_scale(goal, pos, scale):
	goal.position = pos
	goal.scale = scale

func set_player_and_ball(player2_pos, player1_pos, ball_pos):
	$Player2.position = player2_pos
	$Player.position = player1_pos
	$Ball.position = ball_pos

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
