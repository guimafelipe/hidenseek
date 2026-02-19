extends Node

var current_level : int
var max_level_reached: int = 0
var last_level : int

func set_current_level(level: int) -> void:
	current_level = level
	max_level_reached = max(max_level_reached, level)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var levels = ResourceLoader.list_directory("res://Scenes/Levels")
	last_level = levels.size()
	current_level = 1
