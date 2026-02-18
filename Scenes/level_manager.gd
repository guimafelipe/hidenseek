extends Node2D
class_name LevelBase

var waiting_for_next: bool = false

func go_next():
	if not waiting_for_next:
		return
	waiting_for_next = false
	$EyesAnimation.close_eyes()
	await $EyesAnimation.closed_eyes
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func devil_found():
	var devil_animation_tween = self.create_tween()
	var center = get_viewport_rect().get_center()
	devil_animation_tween.tween_property($DevilAnimation, "global_position", center, 0.2)
	await get_tree().create_timer(1.5).timeout
	waiting_for_next = true

func _input(event: InputEvent) -> void:
	if event.is_action("mouse_click"):
		go_next()

func _ready() -> void:
	$Devil.found.connect(devil_found)
	var viewport_rect := get_viewport_rect()
	var vertical_offset = viewport_rect.size.y + $DevilAnimation.texture.get_height()
	$DevilAnimation.global_position = Vector2(viewport_rect.get_center().x, vertical_offset)
	var current_level := self.name.substr(6).to_int() # Level#, we want only the number
	GameProgressManager.current_level = current_level
