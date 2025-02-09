extends Node2D

const CUT_TIME := 1.0
var is_hitted := false 

@onready var sprite := $Sprite2D
@onready var particles_apple_parts := [
	$AppleParticles2D,
	$AppleParticles2D2
]

func _on_area_2d_body_entered(body: Node2D) -> void:
	if not is_hitted:
		is_hitted = true
		cut_apple_and_free()

func cut_apple_and_free():
	sprite.hide()
	
	var tween := create_tween()
	
	for apple_particles_part in particles_apple_parts:
		tween.parallel().tween_property(apple_particles_part, "modulate", Color("ffffff00"), CUT_TIME)
		apple_particles_part.emitting = true
		
	await tween.finished
	queue_free()
