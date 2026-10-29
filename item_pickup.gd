extends Node2D

@export var life = false
@export var coin = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$AnimationPlayer2.play("pickup")
		if life:
			body.add_life()
		if coin:
			print("coin")
			pass

func delete():
	print("delete")
	queue_free()
