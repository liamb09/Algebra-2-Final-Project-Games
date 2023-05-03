extends ColorRect
signal unpause

var alpha = 0
const SPEED = 200
var direction = 1
var fading = false

func _ready():
	color = Color(0, 0, 0, 0)

func _process(delta):
	if get_tree().paused:
		fading = true
		show()
	if fading:
		if alpha == 255:
			direction = -1
			get_tree().paused = false
			emit_signal("unpause")
		if direction == 1:
			alpha = min(alpha+SPEED*delta, 255)
		else:
			alpha = max(alpha-SPEED*delta, 0)
			if alpha == 0:
				fading = false
				direction = 1
				hide()
		color = Color(0, 0, 0, alpha/255)
