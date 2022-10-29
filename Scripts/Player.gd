extends KinematicBody2D

var velocity = Vector2.ZERO
var move_speed = 480
var gravity = 1200

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	move_and_slide(velocity)
