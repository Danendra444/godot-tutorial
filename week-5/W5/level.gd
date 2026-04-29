class_name Level extends Node

@export var next_level: PackedScene

signal goal_reached(next_level: PackedScene)
signal player_died


func _on_goal_player_entered() -> void:
	goal_reached.emit(next_level)


func _on_boundary_body_entered(body: Node2D) -> void:
	player_died.emit()
