extends Node2D

signal lines_ended

var is_active := false
var is_devil_found := false
var lines: PackedStringArray
var current_line := 0

var chat_box : Label
var demon_sprite : Sprite2D
var pivot : Node2D
var blur_material : Material

func set_lines(_lines : PackedStringArray) -> void:
	lines = _lines
	current_line = 0
	chat_box.text = lines[0]

func animate_line() -> void:
	is_active = false
	chat_box.visible_ratio = 0
	GlobalAudioManager.demon_talk()
	var tween = self.create_tween()
	tween.tween_property(chat_box, "visible_ratio", 1, 1)
	await tween.finished
	is_active = true

func move_animation(up: bool) -> void:
	var devil_animation_tween = self.create_tween()
	var destination: Vector2
	if up:
		destination = get_viewport_rect().get_center()
	else:
		var destination_y = get_viewport_rect().size.y
		destination_y += demon_sprite.texture.get_size().y
		destination = Vector2(get_viewport_rect().get_center().x, destination_y)
		
	
	devil_animation_tween.tween_property(pivot, "global_position", destination, 0.2)
	await devil_animation_tween.finished
	if not up:
		blur_material.set_shader_parameter("is_active", false)

func show_next_line() -> void:
	if current_line + 1 < lines.size():
		chat_box.text = lines[current_line + 1]
		current_line = current_line + 1
		animate_line()
	else:
		lines_ended.emit()
		is_active = false
		move_animation(false)

func _input(event: InputEvent) -> void:
	if not is_active:
		return
	if event.is_action_pressed("mouse_click"):
		show_next_line()

func devil_found():
	if is_devil_found:
		return
	
	blur_material.set_shader_parameter("is_active", true)
	is_devil_found = true
	move_animation(true)
	animate_line()

func _ready() -> void:
	chat_box = $DemonPivot/ChatBox
	pivot = $DemonPivot
	demon_sprite = $DemonPivot/DemonSprite
	blur_material = $Blur.material
	$Blur.global_position = Vector2(0, 0)
	chat_box.visible_ratio = 0
	var viewport_rect := get_viewport_rect()
	var vertical_offset = viewport_rect.size.y + demon_sprite.texture.get_height()
	pivot.global_position = Vector2(viewport_rect.get_center().x, vertical_offset)
	
