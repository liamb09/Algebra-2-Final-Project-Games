extends Area2D
class_name Player2

export var speed = 400

func _process(delta):
	var direction = Vector2.ZERO
	if Input.is_action_pressed("move_up2"):
		direction.y -= 1
	if Input.is_action_pressed("move_down2"):
		direction.y += 1
	if Input.is_action_pressed("move_right2"):
		direction.x += 1
	if Input.is_action_pressed("move_left2"):
		direction.x -= 1
	
	if direction.length() > 1:
		direction = direction.normalized()
	
	position.x = clamp(position.x, 0+20, 540-20)
	position.y = clamp(position.y, 0+100, 960-300)
	
	position += direction * speed * delta
	
	if direction.x != 0:
		$AnimatedSprite.animation = "right"
		$AnimatedSprite.flip_h = direction.x > 0
		$AnimatedSprite.flip_v = false

func _on_Player2_area_entered(area):
	if area.is_in_group("enemies"):
		queue_free()
