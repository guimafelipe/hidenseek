extends Node2D
class_name LevelBase

var current_level

var demon_lines: PackedStringArray

func go_next():
	$EyesAnimation.close_eyes()
	await $EyesAnimation.closed_eyes
	var next_level = str(current_level+1)
	print("Next level:", next_level)
	get_tree().change_scene_to_file("res://Scenes/Levels/level_" + next_level + ".tscn")

func devil_found():
	$DevilAnimation.devil_found()

func _on_devil_lines_ended() -> void:
	go_next()

func _ready() -> void:
	current_level = self.name.substr(5).to_int() # Level#, we want only the number
	GameProgressManager.current_level = current_level
	
	var lines = FileAccess.open("res://Assets/DemonLines/lines_" + str(current_level) + ".txt", FileAccess.READ)
	var content = lines.get_as_text()
	demon_lines = content.split("\n", false)
	
	$Devil.found.connect(devil_found)
	var viewport_rect := get_viewport_rect()
	var vertical_offset = viewport_rect.size.y + $DevilAnimation.texture.get_height()
	$DevilAnimation.global_position = Vector2(viewport_rect.get_center().x, vertical_offset)
	$DevilAnimation.lines_ended.connect(_on_devil_lines_ended)
	$DevilAnimation.set_lines(demon_lines)
