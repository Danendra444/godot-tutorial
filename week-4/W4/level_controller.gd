extends Node

@export var current_level: PackedScene

@onready var level: Level = $CurrentLevel

func _ready() -> void:
	level.goal_reached.connect(_on_reach_goal)

func transition_to_level(to_level_scene: PackedScene) -> void:
	var to_level = to_level_scene.instantiate()
	assert(to_level is Level)
	current_level = to_level_scene
	level.queue_free()
	level = to_level
	add_child(level)
	level.goal_reached.connect(_on_reach_goal)

func restart() -> void:
	level.queue_free()
	level = current_level.instantiate()
	add_child(level)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("restart"):
		restart()

func _on_reach_goal(next_level: PackedScene) -> void:
	transition_to_level(next_level)
