extends CharacterBody2D

var is_flying := false
var speed := 4500.0

func _physics_process(delta: float) -> void:
	if is_flying:
		move_and_collide(Vector2.UP * speed * delta)

func throw():
	is_flying = true
