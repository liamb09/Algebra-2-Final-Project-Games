class_name DangerObject
extends Area2D

onready var vis_notifier: VisibilityNotifier2D = get_node("VisibilityNotifier2D")

enum MOVING_DIRECTION {
	LEFT = 180,
	RIGHT = 0, 
	DOWN = 90,
	UP = -90,
	DIA_RIGHT = 60,
	DIA_LEFT = -50
}

var speed = 30
export var rotation_d: int = 45

var made_contact: bool = false

func _ready():
	rotation_degrees = self.rotation_d
	self.vis_notifier.connect("screen_exited", self, "queue_free")
	$AnimatedSprite.connect("animation_finished", self, "_animation_finsihed")
	self.connect("body_entered", self, "_on_hit")

func _process(delta):
	if !made_contact:
		position += transform.x * speed * delta
	
func _on_hit(body: Node) -> void:
	self.made_contact = true
	if body.has_method("take_damage"):
		pass
		body.take_damage() 
	else:
		$Hitbox.set_deferred("disabled", true)
		$AnimatedSprite.play("break")

func _animation_finsihed() -> void:
	if $AnimatedSprite.animation == "break":
		self.queue_free()
	else:
		return
