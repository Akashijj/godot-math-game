extends TextureProgress

func _physics_process(delta: float) -> void:
	value = get_tree().root.get_node("Game").get_node("Player").health
