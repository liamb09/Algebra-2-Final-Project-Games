class_name EffectContainer
extends Node2D


func add_effect_to_screen(effect: PackedScene, pos: Vector2) -> void:
	var new_effect: AnimatedSprite = effect.instance()
	new_effect.global_position = pos
	self.add_child(new_effect)
