extends Node2D

signal attack_enemie(answer)

func _on_input_text_entered(new_text: String) -> void:
	emit_signal("attack_enemie", new_text)
