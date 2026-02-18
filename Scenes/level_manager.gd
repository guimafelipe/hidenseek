extends Node2D

var waiting_for_next: bool = false

func go_next():
	if not waiting_for_next:
		return

func devil_found():
	# show devil animation and message
	waiting_for_next = true

func _input(event: InputEvent) -> void:
	if event.is_action("mouse_click"):
		go_next()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
