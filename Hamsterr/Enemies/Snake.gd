extends Enemy

func _process(delta):
	$AnimationPlayer.play("Slithering")
	if speed < 0:
		$DogSprite.flip_h = false
		$DogSprite.flip_v = true

