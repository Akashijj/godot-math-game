extends KinematicBody2D

var challenge: int = 2*4
var hited: bool = false

func _on_Node2D_attack_enemie(answer) -> void:
	if int(answer) == challenge:
		print('Resposta correta')
		hited = true


func _physics_process(delta: float) -> void:
	var velocity = Vector2(-100, 0)
	velocity = move_and_slide(velocity)
	
	_set_animation()


func _set_animation():
	var anim = 'run'
	
	if hited:
		anim = 'hit'
	
	$anim.play(anim)
