extends Node

var current_level : int
var max_level_reached: int = 0
var last_level : int

func save():
	var mlr = max_level_reached
	var save_game = FileAccess.open("user://game_data.save", FileAccess.WRITE)
	var save_dict = {
		"dingodiles": mlr ,
	}
	save_game.store_line(JSON.stringify(save_dict))
	save_game.close()

func load_game():
	if(not FileAccess.file_exists("user://game_data.save")):
		return
	
	var save_game = FileAccess.open("user://game_data.save", FileAccess.READ)
	var info = JSON.parse_string(save_game.get_line())
	max_level_reached = info["dingodiles"]
	save_game.close()

func set_max_level_reached(value: int):
	if(max_level_reached > value):
		return
	max_level_reached = value
	save()

func set_current_level(level: int) -> void:
	current_level = level
	max_level_reached = max(max_level_reached, level)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_game()
	var levels = ResourceLoader.list_directory("res://Scenes/Levels")
	last_level = levels.size()
	current_level = 1
