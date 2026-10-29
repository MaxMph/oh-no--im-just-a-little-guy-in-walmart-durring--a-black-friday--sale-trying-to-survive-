extends Node

@onready var audioscene= preload("res://audio_manager.tscn")
var audio_manager

func _ready() -> void:
	add_child(audioscene.instantiate())
	for i in get_children():
		if i.is_in_group("audio_manager"):
			audio_manager = i

func _process(delta: float) -> void:
	pass
