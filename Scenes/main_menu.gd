extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if GameProgressManager.max_level_reached > 1:
		$VBoxContainer/ContinueButton.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/level_1.tscn")


func _on_credits_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/credits.tscn")


func _on_continue_button_pressed() -> void:
	var max_level_reached = str(GameProgressManager.max_level_reached)
	get_tree().change_scene_to_file("res://Scenes/Levels/level_" + max_level_reached + ".tscn")
	
