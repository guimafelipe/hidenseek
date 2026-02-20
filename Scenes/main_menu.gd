extends Control

func _ready() -> void:
	if GameProgressManager.max_level_reached > 1:
		$VBoxContainer/ContinueButton.visible = true
	if GameProgressManager.max_level_reached == GameProgressManager.last_level:
		# todo: change credits button
		pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("back"):
		get_tree().quit()

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/level_1.tscn")

func _on_credits_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/credits.tscn")

func _on_continue_button_pressed() -> void:
	var max_level_reached = str(GameProgressManager.max_level_reached)
	get_tree().change_scene_to_file("res://Scenes/Levels/level_" + max_level_reached + ".tscn")
