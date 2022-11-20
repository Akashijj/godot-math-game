extends KinematicBody2D

var health = 100

# adiciona gravidade ao Player
var velocity = Vector2.ZERO
var move_speed = 480
var gravity = 1200
onready var node := $Game as Node2D


func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	move_and_slide(velocity)


func _on_Enemie_damage(amount) -> void:
	health -= amount
	
	if health == 0:
		_gameOver()


func _gameOver() -> void:
	yield(get_tree().create_timer(0.4), "timeout")
	get_tree().change_scene("res://Scenes/GameOver.tscn")
	queue_free()


func _on_EnemyHandler_child_entered_tree(node):
	node.connect("damage", self, "_on_Enemie_damage")
