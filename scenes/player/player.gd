class_name Player
extends Node3D


enum Lane{LEFT, MIDDLE, RIGHT}

var tween: Tween
var current_lane: Lane = Lane.MIDDLE
@export var move_amount: float = 2.0
@export var left_lane_pos: Vector3
@export var middle_lane_pos: Vector3
@export var right_lane_pos: Vector3


func _unhandled_key_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_left"):
		if current_lane != Lane.LEFT:
			tween = get_tree().create_tween()
		match current_lane:
			Lane.MIDDLE:
				tween.tween_property(self, "global_position", left_lane_pos, 0.5)
				current_lane = Lane.LEFT
			Lane.RIGHT:
				tween.tween_property(self, "global_position", middle_lane_pos, 0.5)
				current_lane = Lane.MIDDLE
	if event.is_action_pressed("ui_right"):
		if current_lane != Lane.RIGHT:
			tween = get_tree().create_tween()
		match current_lane:
			Lane.MIDDLE:
				tween.tween_property(self, "global_position", right_lane_pos, 0.5)
				current_lane = Lane.RIGHT
			Lane.LEFT:
				tween.tween_property(self, "global_position", middle_lane_pos, 0.5)
				current_lane = Lane.MIDDLE
