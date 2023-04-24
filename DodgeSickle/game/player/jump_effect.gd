extends AnimatedSprite


func _ready():
	self.connect("animation_finished", self, "queue_free")

