extends KinematicBody2D

signal enemy_hitted()

var speed = 400
var shoot = false
var destination := Vector2()

func init(enemy_position):
	destination = enemy_position
	destination.y = destination.y - 40
	
func _physics_process(delta):
	if destination != null:
		var gap = Vector2(destination - position)
		move_and_slide(destination.normalized() * speed)
		
		if $RayCast2D.is_colliding():
			emit_signal("enemy_hitted")
			queue_free()
