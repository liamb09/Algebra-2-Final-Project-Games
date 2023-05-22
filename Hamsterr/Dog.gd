extends Enemy

func _process(delta):
	$AnimationPlayer.play("Walking")
	if speed < 0:
		$DogSprite.flip_h = false
		$DogSprite.flip_v = true
