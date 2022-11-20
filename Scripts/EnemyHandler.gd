extends Node2D

onready var slime = preload("res://Scenes/Enemie3.tscn")
onready var chammeleon = preload("res://Scenes/Enemie2.tscn")
onready var frog = preload("res://Scenes/Enemie1.tscn")

var count = 0

signal send_challange_and_answer(challenge, answer)

var enemiesCreated = 0
var level = 1

#############################
# Spawn de mobs
#############################

func _ready():
	pass

var levelChallenges = {
	0 : {
	"4 - 2": "2",
	"5 + 2": "7",
	"2 + 2": "4",
	"10 + 2": "12",
	"7 + 4": "11",
	"80 + 9": "89",
	"13 + 7": "20",
	"9 - 2": "7",
	"14 - 1": "13",
	"13 - 1": "12",
	"10 - 9": "1",
	"10 - 3": "7",
	"8 - 2": "6",
	"90 - 1": "89",
	"87 - 3": "84"},
	1 : {
	"3 x 18": "54",
	"66 / 6": "11",
	"2 x 4": "8",
	"2 x 15": "30",
	"80 / 4": "20",
	"3 x 3": "9",
	"4 x 4": "16",
	"9 x 2": "18",
	"10 / 2": "5",
	"21 / 3": "7"},
	2 : {
	"√9": "3",
	"3^3": "27",
	"12^2": "144",
	"√16": "4",
	"√25": "5"
	}
}

var rng = RandomNumberGenerator.new()
var n = rng.randomize()

func defineRandomChallenge(challenges_collection, level) -> Array:
	var randomLevel = floor(rng.randf_range(0, level + 1))	
	if(randomLevel > level - 1): randomLevel = level - 1
	
	var levelChoice = challenges_collection.values()[randomLevel]	
	
	var challengeIndex = floor(rng.randf_range(0, levelChoice.size()))	
	
	var challenge = levelChoice.keys()[challengeIndex]
	var answer = levelChoice.values()[challengeIndex]
	
	return [challenge, answer, randomLevel + 1]

func newEnemy(typeOfEnemy):
	count += 1
	var newEnemy = typeOfEnemy.instance()
	newEnemy.name = 'enemy' + str(count)	
	
	self.add_child(newEnemy)	

func _on_Timer_timeout():
		var random_challenge = defineRandomChallenge(levelChallenges, level)
		var challenge = random_challenge[0]
		var answer = random_challenge[1]
		var levelEnemy = random_challenge[2]
		
		if(levelEnemy == 3):
			newEnemy(chammeleon)
		elif (levelEnemy == 2):
			newEnemy(frog)
		else:
			newEnemy(slime)
		
		emit_signal("send_challange_and_answer", challenge, answer, levelEnemy)
		
		if(enemiesCreated == 1 && level < 3):
			print("Level Changed")
			level += 1
			enemiesCreated = 0	
		else: 
			enemiesCreated += 1	
