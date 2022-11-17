extends Node2D

signal attack_enemie(answer)


func _on_input_text_entered(new_text: String) -> void:
	emit_signal("attack_enemie", new_text)


#############################
# Spawn de mobs
#############################
onready var easy_enemy = preload("res://Scenes/Enemie.tscn")
onready var spawner := $spawnpoint as Position2D

func newEnemy(typeOfEnemy):
	var newEnemy = typeOfEnemy.instance()
	get_parent().add_child(newEnemy)
	newEnemy.position = spawner.position

func _on_Timer_timeout():
	newEnemy(easy_enemy)

