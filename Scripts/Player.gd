extends KinematicBody2D

var health = 5

# adiciona gravidade ao Player
var velocity = Vector2.ZERO
var move_speed = 480
var gravity = 1200

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	move_and_slide(velocity)


func _on_Enemie_damage(amount) -> void:
	if health > 1:
		health -= amount
		print("Took damage!")
		print("Current life: ", health)
	
	else:
		print("Died...")
