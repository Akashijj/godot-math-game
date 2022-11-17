extends CanvasLayer


func _ready() -> void:
	pass



func _on_BtnRetry_pressed() -> void:
	get_tree().change_scene("res://Versions/V1.tscn")
