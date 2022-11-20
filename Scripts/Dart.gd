extends KinematicBody2D

signal enemy_hitted()

var destination = Vector2(1, 0)
var speed = 400

func _ready():
	if (get_tree().root.get_node("Game").get_node("EnemyHandler").has_node("enemy1")):
		get_tree().root.get_node("Game").get_node("EnemyHandler").get_node("enemy1").connect("send_destination", self, "_on_Enemie1_send_destination")
	
	get_tree().root.get_node("Game").get_node("EnemyHandler").connect("child_entered_tree", self, "_on_Game_send_node")


func _on_Game_send_node(node):
	node.connect("send_destination", self, "_on_Enemie_send_destination")


func _on_Enemie_send_destination(new_destination):
	destination = new_destination	


func _on_Enemie1_send_destination(new_destination):
	destination = new_destination


func _physics_process(delta):
	var gap = Vector2(destination - position)
	move_and_slide(gap.normalized() * speed)
	
	
	if $RayCast2D.is_colliding():
		emit_signal("enemy_hitted")
		queue_free()
		

