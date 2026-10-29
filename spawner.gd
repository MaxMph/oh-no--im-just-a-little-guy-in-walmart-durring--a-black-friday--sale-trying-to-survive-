extends Node

var spawn_bounds = 512

var step_spawn_time = 0.2
var spawn_time_bounds = Vector2(0.01, 1.0)


@onready var life = preload("res://life_pickup.tscn")
@onready var coin = preload("res://coin.tscn")
@onready var step = preload("res://step.tscn")

func _ready() -> void:
	step_spawn(step_spawn_time)
	step_spawn(step_spawn_time)
	life_spawn(20)
	coin_spawn(15)


func _process(delta: float) -> void:
	pass

func step_spawn(wait_time):
	print("step")
	var new_step = step.instantiate()
	new_step.rotation = deg_to_rad(randf_range(0, 390))
	new_step.global_position = $"../CharacterBody2D".global_position + Vector2(randi_range(-spawn_bounds, spawn_bounds), randi_range(-spawn_bounds, spawn_bounds))
	add_child(new_step)
	await get_tree().create_timer(wait_time).timeout
	#step_spawn(wait_time)
	step_spawn(randf_range(spawn_time_bounds.x, spawn_time_bounds.y))

func life_spawn(wait_time):
	var new_life = life.instantiate()
	#new_life.rotation = deg_to_rad(randf_range(0, 390))
	new_life.global_position = $"../CharacterBody2D".global_position + Vector2(randi_range(-spawn_bounds, spawn_bounds), randi_range(-spawn_bounds, spawn_bounds))
	add_child(new_life)
	await get_tree().create_timer(wait_time).timeout
	life_spawn(wait_time)
	

func coin_spawn(wait_time):
	var new_life = coin.instantiate()
	#new_life.rotation = deg_to_rad(randf_range(0, 390))
	new_life.global_position = $"../CharacterBody2D".global_position + Vector2(randi_range(-spawn_bounds, spawn_bounds), randi_range(-spawn_bounds, spawn_bounds))
	add_child(new_life)
	await get_tree().create_timer(wait_time).timeout
	life_spawn(wait_time)

func _on_timer_timeout() -> void:
	step_spawn(step_spawn_time)
