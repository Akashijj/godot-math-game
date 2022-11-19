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

func defineRandomChallenge(challenges_collection) -> Array:
	var my_random_number = rng.randf_range(0, challenges_collection.size())	

	var challenge = challenges_collection.keys()[my_random_number]
	var answer = challenges_collection.values()[my_random_number]
	
	return [challenge, answer]


func newEnemy(typeOfEnemy):
	count += 1
	var newEnemy = typeOfEnemy.instance()
	newEnemy.name = 'enemy' + str(count)	
	
	self.add_child(newEnemy)	


func _on_Timer_timeout():
	if easy_challenges.size() != 0:
		var random_challenge = defineRandomChallenge(easy_challenges)
		var challenge = random_challenge[0]
		var answer = random_challenge[1]
		
		easy_challenges.erase(challenge)
	
		emit_signal("child_entered_tree")
		
		newEnemy(easy_enemy)
		emit_signal("send_challange_and_answer", challenge, answer)
		for i in self.get_child_count():
			var node = self.get_child(i)
	
		
