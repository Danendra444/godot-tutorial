extends Node

@export var current_level: PackedScene

@onready var level: Level = $CurrentLevel

func transition_to_level(to_level_scene: PackedScene) -> void:
	var to_level = to_level_scene.instantiate()
	assert(to_level is Level)
	current_level = to_level_scene
	level.queue_free()
	level = to_level
	add_child(level)

func restart() -> void:
	level.queue_free()
	level = current_level.instantiate()
	add_child(level)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("restart"):
		restart()
