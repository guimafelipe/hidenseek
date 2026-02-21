@tool
extends Node2D

signal found
var already_found := false
@export var DISTANCE_TO_BE_CORRECT : float = 50.0

func _input(event) -> void:
	if event.is_action_pressed("mouse_click"):
		check_click(event.position)

func _process(delta: float) -> void:
	if Engine.is_editor_hint():
		$TestSprite.texture.size = Vector2(DISTANCE_TO_BE_CORRECT, DISTANCE_TO_BE_CORRECT)
	
func _ready():
	$TestSprite.modulate.a = 0.4
	if not Engine.is_editor_hint():
		$TestSprite.visible = false

func do_success():
	if already_found:
		return
	already_found = true
	found.emit()

func check_click(input_position: Vector2) -> void:
	var dist = self.position.distance_to(input_position)
	print(dist)
	if dist < DISTANCE_TO_BE_CORRECT:
		do_success()
