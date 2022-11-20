extends Label

var score = 0

func _on_Enemie_death(point): 
	score += point
	self.text = str(score)

func _on_EnemyHandler_child_entered_tree(node):
	node.connect("death", self, "_on_Enemie_death")
