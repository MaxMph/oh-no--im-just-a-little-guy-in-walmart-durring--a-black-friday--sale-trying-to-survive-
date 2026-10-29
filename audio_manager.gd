extends Node

func _ready() -> void:
	pass 


func _process(delta: float) -> void:
	pass


func fade(node: Node):
	pass

func play_sound(soundName):
	var sound = get_node_or_null(soundName)
	if sound:
		sound.play()
	else:
		print("couldnt play " + soundName)
		#push_warning("AudioManager: sound not found: " + soundName)

func stop_sound(soundName):
	var sound = get_node_or_null(soundName)
	if sound:
		sound.stop()
	else:
		print("couldnt find " + soundName)
		

func pause_sound(soundName):
	var sound = get_node_or_null(soundName)
	if sound:
		sound.stream_paused = true
	else:
		print("couldnt find " + soundName)

func unpause_sound(soundName):
	var sound = get_node_or_null(soundName)
	if sound:
		sound.stream_paused = false
	else:
		print("couldnt find " + soundName)
