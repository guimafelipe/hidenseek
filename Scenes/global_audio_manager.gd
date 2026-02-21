extends Node

var yaps : PackedStringArray

func demon_talk() -> void:
	$Music.volume_linear = 0.5
	$Yap.stop()
	var num_yaps = yaps.size()
	randomize()
	var i = randi() % num_yaps
	$Yap.stream = ResourceLoader.load("res://Assets/Audio/Voices/GnomoA" + str(i+1) + ".wav")
	$Yap.play()
	await $Yap.finished
	$Music.volume_linear = 1.0

func _ready() -> void:
	yaps = ResourceLoader.list_directory("res://Assets/Audio/Voices")
