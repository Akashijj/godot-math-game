extends KinematicBody2D

signal damage(amount)
var health: int  = 1
var hitted: bool = false
var velocity = Vector2(-100, 0)
onready var timer := $Timer as Timer
var start_timer = false

#############################
# Dinâmica de desafios
# para cada inimigo gerado, um dos desafios deve ser atribuido a ele
#############################
var easy_challenges = {
	"3 x 18": "54",
	"45 - 27": "18",
	"66 / 6": "11",
	"39 + 29": "68"
}

var rng = RandomNumberGenerator.new()
var n = rng.randomize()

var my_random_number = rng.randf_range(0, easy_challenges.size())	

var challenge = easy_challenges.keys()[my_random_number]
var answer = easy_challenges.values()[my_random_number]


func _ready() -> void:
	get_node("Label").text = challenge
	
	if start_timer:
		timer.start()
	


func _on_Node2D_attack_enemie(input_answer) -> void:
	#print(input_answer)
	
	if input_answer == answer:
		print('Resposta correta')
		# TODO: criar funcao _throw_arrow() que verifique a colisao da flecha
		# com o inimigo e execute o codigo abaixo
		hitted = true
		health -= 1
		#yield(get_tree().create_timer(0.4), "timeout")
		hitted = false
		if health < 1:
			get_parent().remove_child(self)


func _physics_process(delta: float) -> void:
	velocity = move_and_slide(velocity)
	
	_set_animation()


func _set_animation() -> void:
	var anim = 'run'
	
	if hitted:
		anim = 'hit'
		velocity.x = 0
	
	else:
		velocity.x = -100
	
	$anim.play(anim)


func _on_Timer_timeout() -> void:
	if $ray_wall.is_colliding():
		emit_signal("damage", 10)

