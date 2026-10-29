extends Node2D

var hit_time = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Foot1.modulate = Color(0 , 0, 0, 0)
	$Timer.wait_time = hit_time
	$Timer.start()
	#await get_tree().create_timer(hit_time).timeout
	await $Timer.timeout
	step()
	


func _process(delta: float) -> void:
	
	$Foot1.modulate = Color(0,0,0, 1 - $Timer.time_left / hit_time) #$Timer.time_left / hit_time * 220)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.die()

func step():
	Global.audio_manager.play_sound("stomp")
	$Area2D/CollisionPolygon2D.disabled = false
	$Foot2.show()
	await get_tree().physics_frame
	$StaticBody2D/CollisionPolygon2D.disabled = false
	$AnimationPlayer.play("land")
	$Foot1.hide()
	
	
