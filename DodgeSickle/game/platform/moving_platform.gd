extends KinematicBody2D


onready var vis_noti: VisibilityNotifier2D = get_node("VisibilityNotifier2D")

var velocity: Vector2

func _ready() -> void:
	self.vis_noti.connect("screen_exited", self, "queue_free")


func _process(delta) -> void:
	self.position += Vector2(20, -20) * delta
	
