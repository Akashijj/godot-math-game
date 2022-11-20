extends KinematicBody2D

signal enemy_hitted()

var speed = 400
var shoot = false
var destination

func init(enemy_position):
	destination = enemy_position

func _ready():
	if (get_tree().root.get_node("Game").get_node("EnemyHandler").has_node("enemy")):
		get_tree().root.get_node("Game").get_node("EnemyHandler").get_node("enemy").connect("allow_shoot", self, "_on_Enemie1_allow_shoot")


func _physics_process(delta):
	if destination != null:
		var gap = Vector2(destination - position)
		move_and_slide(destination.normalized() * speed)
		
		
		if $RayCast2D.is_colliding():
			emit_signal("enemy_hitted")
			queue_free()

