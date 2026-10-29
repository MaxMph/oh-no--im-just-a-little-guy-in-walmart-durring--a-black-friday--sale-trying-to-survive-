extends CharacterBody2D

var speed = 300.0
var acc = 2000.0
var fric = 2000.0

var dead = false
var coins = 0
var time = 0

func _physics_process(delta: float) -> void:
	time += delta

	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if direction and dead == false:
		velocity = velocity.move_toward(direction.normalized() * speed, acc * delta)
		$AnimatedSprite2D.play()
		#print(str(position))
		$AnimatedSprite2D.rotation = velocity.angle() + deg_to_rad(90)
	else:
		velocity =  velocity.move_toward(Vector2.ZERO, fric * delta)
		$AnimatedSprite2D.pause()
#$AnimatedSprite2D.rotation = velocity.angle() + deg_to_rad(90)

	$CanvasLayer/Control/coins.text = str(coins)
	$CanvasLayer/Control/timer.text = str(round(time))

	move_and_slide()


func die():
	
	var lives_left = 0
	for i in %lives.get_children():
		if i.visible == true:
			lives_left += 1
	if lives_left <= 1:
		$CanvasLayer/Control/ColorRect/AnimationPlayer.play("fade")
		dead = true
		Global.audio_manager.play_sound("die")
		Global.audio_manager.play_sound("cancel")
	else:
		Global.audio_manager.play_sound("hit")
		Global.audio_manager.play_sound("cancel")
		for i in %lives.get_children():
			if i.visible == true:
				i.visible = false
				return

func add_life():
	var life_added = false
	for i in %lives.get_children():
		if i.visible == false:
			i.visible = true
			life_added = true
			return
	if life_added:
		pass

func scene_change():
	get_tree().change_scene_to_file("res://main_menu.tscn")
