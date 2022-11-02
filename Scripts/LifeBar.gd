extends TextureProgress

func _physics_process(delta: float) -> void:
	value = get_tree().root.get_node("Node2D").get_node("Player").health
