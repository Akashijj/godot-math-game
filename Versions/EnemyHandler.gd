extends Node2D

onready var easy_enemy = preload("res://Scenes/Enemie.tscn")
onready var spawner := $spawnpoint as Position2D
var count = 0

#############################
# Spawn de mobs
#############################

func _ready():
	pass

func newEnemy(typeOfEnemy):
	count += 1
	var newEnemy = typeOfEnemy.instance()
	newEnemy.name = 'enemy' + str(count)	
	self.add_child(newEnemy)
	

func _on_Timer_timeout():
	emit_signal("child_entered_tree")
	newEnemy(easy_enemy)
	for i in self.get_child_count():
		var node = self.get_child(i)
