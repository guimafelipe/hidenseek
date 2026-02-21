extends Node

var yaps : PackedStringArray

func demon_talk() -> void:
	$Yap.stop()
	var num_yaps = yaps.size()
	randomize()
	var i = randi() % num_yaps
	$Yap.stream = ResourceLoader.load("res://Assets/Audio/Voices/GnomoA" + str(i+1) + ".wav")
	$Yap.play()

func _ready() -> void:
	yaps = ResourceLoader.list_directory("res://Assets/Audio/Voices")
