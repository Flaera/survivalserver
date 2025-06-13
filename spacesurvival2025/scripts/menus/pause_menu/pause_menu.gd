extends ColorRect


func _on_button_resume_pressed() -> void:
	get_tree().paused=false
	visible=false
	


func _on_button_back_pressed() -> void:
	get_tree().paused=false
	get_tree().change_scene_to_file("res://levels/selector_levels.tscn")
