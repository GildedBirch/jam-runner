class_name PathMover
extends Node3D


signal end_of_path(node: Node3D)

@export var active: bool = false


func _process(delta: float) -> void:
	if active:
		global_position.z += 10 * delta
		if global_position.z >= 10.0:
			end_of_path.emit(self)


func set_active(start_pos: Vector3, stop_pos: Vector3, move_time: float) -> void:
	global_position = start_pos
	show()
	active = true
	#var tween = get_tree().create_tween()
	#tween.tween_property(self, "global_position", stop_pos, move_time)
	#await tween.finished


func set_inactive(inactive_pos: Vector3) -> void:
	active = false
	hide()
	global_position = inactive_pos
