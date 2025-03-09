class_name PathMaker
extends Node


@export var game_speed: float = 1.0
@export var path_move_speed: float = 5.0
@export var path_start_pos: Vector3 = Vector3(0, 0, -30)
@export var path_end_pos: Vector3 = Vector3(0, 0, 10)
@export var path_inactive_pos: Vector3 = Vector3(0, -10, -30)

@onready var active: Node = %Active
@onready var inactive: Node = %Inactive


func _ready() -> void:
	for path: PathMover in active.get_children():
		path.end_of_path.connect(_on_path_reach_end)
	for path: PathMover in inactive.get_children():
		path.end_of_path.connect(_on_path_reach_end)


func new_path(start: Vector3, end: Vector3, speed: float) -> void:
	var path: PathMover = inactive.get_children().pick_random()
	inactive.remove_child(path)
	active.add_child(path)
	path.set_active(start, end, speed)


func _on_path_reach_end(path: Node3D) -> void:
	active.remove_child(path)
	inactive.add_child(path)
	path.set_inactive(path_inactive_pos)
	new_path(path_start_pos, path_end_pos, path_move_speed)
