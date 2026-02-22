extends Node2D
class_name LevelBase

var current_level: int

func go_next():
	$EyesAnimation.close_eyes()
	await $EyesAnimation.closed_eyes
	var next_level = str(current_level+1)
	# print("Next level:", next_level)
	get_tree().change_scene_to_file("res://Scenes/Levels/level_" + next_level + ".tscn")

func _on_devil_lines_ended() -> void:
	go_next()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("back"):
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func _ready() -> void:
	current_level = self.name.substr(5).to_int() # Level#, we want only the number
	GameProgressManager.set_max_level_reached(current_level)
	if current_level == GameProgressManager.last_level:
		return
	
	var lines = FileAccess.open("res://Assets/DemonLines/lines_" + str(current_level) + ".txt", FileAccess.READ)
	var content = lines.get_as_text()
	lines.close()
	var demon_lines := content.split("\n", false)
	
	$Devil.found.connect($DevilAnimation.devil_found)
	$DevilAnimation.lines_ended.connect(_on_devil_lines_ended)
	$DevilAnimation.set_lines(demon_lines)
