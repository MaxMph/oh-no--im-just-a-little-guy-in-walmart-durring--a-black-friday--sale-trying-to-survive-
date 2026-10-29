extends Control

@onready var game_scene = preload("res://world.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$VBoxContainer/HBoxContainer/start.grab_focus()
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $VBoxContainer/HBoxContainer2/close.is_hovered() or $VBoxContainer/HBoxContainer2/close.has_focus():
		$VBoxContainer/HBoxContainer2/TextureRect.show()
	else:
		$VBoxContainer/HBoxContainer2/TextureRect.hide()

	if $VBoxContainer/HBoxContainer/start.is_hovered() or $VBoxContainer/HBoxContainer/start.has_focus():
		$VBoxContainer/HBoxContainer/TextureRect.show()
	else:
		$VBoxContainer/HBoxContainer/TextureRect.hide()

func _on_close_pressed() -> void:

	get_tree().quit()




func _on_start_pressed() -> void:
	get_tree().change_scene_to_packed(game_scene)
	Global.audio_manager.play_sound("select")


func _on_close_focus_entered() -> void:
	Global.audio_manager.play_sound("click")


func _on_start_focus_entered() -> void:
	Global.audio_manager.play_sound("click")
