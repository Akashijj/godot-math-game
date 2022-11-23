extends LineEdit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	grab_focus() # inicia o input com foco
	
func _on_input_text_entered(new_text: String) -> void:
	clear()
