extends KinematicBody2D

var speed = 100
var log_exit = 0
export var wait_time = 0

func _ready():
	set_collision_layer_bit(0, true)
	set_collision_mask_bit(0, true)

func _process(delta):
	position.x += speed*delta
	if speed > 0:
		if stepify(position.x, 2) > get_viewport().size.x+(speed*wait_time)+64:
			position.x = -64
			show()
	elif speed < 0:
		if position.x < speed*wait_time:
			position.x = get_viewport().size.x + 64
			show()


func _on_AlligatorReplace_body_entered(body):
	print(body.name)
	if "Alligator" in body.name:
		hide()

func _on_OtterCollide_body_entered(body):
	if "Otter" in body.name:
		queue_free()

func _on_VisibilityNotifier2D_screen_entered():
	show()


func _on_Log_collide_area_entered(area):
	if "LogCollision" in area.name:
		pass

func _on_AlligatorReplace_body_exited(body):
	pass
