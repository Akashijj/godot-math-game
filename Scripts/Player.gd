extends KinematicBody2D

var health = 100

# adiciona gravidade ao Player
var velocity = Vector2.ZERO
var move_speed = 480
var gravity = 1200

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	move_and_slide(velocity)


func _on_Enemie_damage(amount) -> void:
	health -= amount
	
	if health == 0:
		_gameOver()


func _gameOver() -> void:
	yield(get_tree().create_timer(0.4), "timeout")
	queue_free()
	get_tree().change_scene("res://Scenes/GameOver.tscn")
