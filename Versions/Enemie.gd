extends KinematicBody2D

var health: int  = 1
var challenge: int = 2*4
var hitted: bool = false
var velocity = Vector2(-100, 0)


func _on_Node2D_attack_enemie(answer) -> void:
	if int(answer) == challenge:
		print('Resposta correta')
		# TODO: criar funcao que altere a variavel hited somente quando uma flecha
		# entrar em contato com o inimigo
		hitted = true
		health -= 1
		yield(get_tree().create_timer(0.4), "timeout")
		hitted = false
		if health < 1:
			queue_free()


func _physics_process(delta: float) -> void:
	velocity = move_and_slide(velocity)
	
	_set_animation()


func _set_animation():
	var anim = 'run'
	
	if hitted:
		anim = 'hit'
		velocity.x = 0
	
	$anim.play(anim)
