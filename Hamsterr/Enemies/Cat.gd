extends Enemy

func _process(delta):
	$AnimationPlayer.play("cat walk")
	if speed < 0:
		$CatSprite.flip_h = false
		$CatSprite.flip_v = true
