class_name DeathMarkerManager
extends Node2D


const p_DeathMarker: PackedScene = preload("res://game/player/death_marker.tscn")
const MAX_MARKERS: int = 30

onready var _marker_conatiner: Node2D = $MarkerContainer


func add_marker_to_screen(pos: Vector2) -> void:
	var new_marker: Sprite = p_DeathMarker.instance()
	new_marker.global_position = pos
	self._marker_conatiner.add_child(new_marker)
	_remove_oldest_marker()

func _remove_oldest_marker() -> void:
	if _marker_conatiner.get_child_count() > MAX_MARKERS:
		var oldest_marker = _marker_conatiner.get_child(0)
		_marker_conatiner.remove_child(oldest_marker)
