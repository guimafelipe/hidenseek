extends Node2D

@export var DISTANCE_TO_BE_CORRECT : float = 50.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event) -> void:
	if event is InputEventMouseButton:
		if event.pressed:
			check_click(event.position)

func do_success():
	print("Success!!")
	pass

func check_click(input_position: Vector2) -> void:
	var dist = self.position.distance_to(input_position)
	print(dist)
	if dist < DISTANCE_TO_BE_CORRECT:
		do_success()
