extends Sprite2D

signal lines_ended

var is_active := false
var is_devil_found := false
var lines: PackedStringArray
var current_line := 0

func set_lines(_lines : PackedStringArray) -> void:
	lines = _lines
	current_line = 0
	$ChatBox.text = lines[0]

func animate_line() -> void:
	is_active = false
	$ChatBox.visible_ratio = 0
	var tween = self.create_tween()
	tween.tween_property($ChatBox, "visible_ratio", 1, 1)
	await tween.finished
	is_active = true

func show_next_line() -> void:
	if current_line + 1 < lines.size():
		$ChatBox.text = lines[current_line + 1]
		current_line = current_line + 1
		animate_line()
	else:
		lines_ended.emit()
		is_active = false

func _input(event: InputEvent) -> void:
	if not is_active:
		return
	if event.is_action_pressed("mouse_click"):
		show_next_line()

func devil_found():
	if is_devil_found:
		return

	is_devil_found = true
	var devil_animation_tween = self.create_tween()
	var center = get_viewport_rect().get_center()
	devil_animation_tween.tween_property(self, "global_position", center, 0.2)
	await devil_animation_tween.finished
	animate_line()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ChatBox.visible_ratio = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
