extends Node2D

onready var easy_enemy = preload("res://Scenes/Enemie.tscn")
onready var spawner := $spawnpoint as Position2D
var count = 0

signal send_challange_and_answer(challenge, answer)

#############################
# Spawn de mobs
#############################

func _ready():
	pass

var easy_challenges = {
	"2 x 2": "4",
	"5 - 2": "3",
	"66 / 6": "11",
	"1 + 1": "2"
}

var rng = RandomNumberGenerator.new()
var n = rng.randomize()


func newEnemy(typeOfEnemy):
	count += 1
	var newEnemy = typeOfEnemy.instance()
	newEnemy.name = 'enemy' + str(count)	
	
	var my_random_number = rng.randf_range(0, easy_challenges.size())	

	var challenge = easy_challenges.keys()[my_random_number]
	var answer = easy_challenges.values()[my_random_number]		
		
	emit_signal("send_challange_and_answer", challenge, answer)
	self.add_child(newEnemy)
	
	easy_challenges.erase(challenge)
	


func _on_Timer_timeout():
	if easy_challenges.size() != 0:
		
		
		emit_signal("child_entered_tree")
		newEnemy(easy_enemy)
		for i in self.get_child_count():
			var node = self.get_child(i)
	
		
