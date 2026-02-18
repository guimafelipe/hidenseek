extends Node2D

@onready var lower_lid = $LowerLid
@onready var upper_lid = $UpperLid
@export var BLINK_DURATION = 0.5

func set_eyelids_correct_size(eyelid: Sprite2D, width: float, height: float) -> void:
	var scale_x = width/eyelid.texture.get_width()
	var scale_y = height/eyelid.texture.get_height()
	eyelid.scale = Vector2(scale_x, scale_y)
	print(eyelid.scale)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var viewport_rect = get_viewport_rect()
	var center = viewport_rect.get_center().y
	var screen_width = viewport_rect.size.x
	var screen_height = viewport_rect.size.y
	
	upper_lid.offset = Vector2(0, -upper_lid.texture.get_height())
	set_eyelids_correct_size(lower_lid, screen_width, screen_height)
	set_eyelids_correct_size(upper_lid, screen_width, screen_height)
	
	lower_lid.global_position = Vector2(0, center)
	upper_lid.global_position = Vector2(0, center)
	
	var upper_tween = self.create_tween()
	var lower_tween = self.create_tween()
	lower_tween.tween_property(lower_lid, "global_position", Vector2(0,screen_height), BLINK_DURATION)
	upper_tween.tween_property(upper_lid, "global_position", Vector2(0,0), BLINK_DURATION)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
