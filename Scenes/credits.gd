extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if GameProgressManager.max_level_reached == GameProgressManager.last_level:
		var lines = FileAccess.open("res://Assets/DemonLines/lines_credits.txt", FileAccess.READ)
		var content = lines.get_as_text()
		lines.close()
		var demon_lines := content.split("\n", false)
		$Devil.visible = true
		$Devil.found.connect($DevilAnimation.devil_found)
		$DevilAnimation.set_lines(demon_lines)

func _input(event: InputEvent) -> void:
	if event.is_action("back"):
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
