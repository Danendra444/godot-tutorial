class_name Level extends Node

@export var next_level: PackedScene

signal goal_reached(next_level: PackedScene)


func _on_goal_player_entered() -> void:
	goal_reached.emit(next_level)
