extends Control


func _ready():
	$VBoxContainer2/HBoxContainer/ButtonBack.grab_focus()


func _on_button_back_pressed() -> void:
	var mother = get_parent()
	mother.get_node("ControlButtons/VBoxContainer/ButtonNew").grab_focus()
	get_tree().reload_current_scene()
	queue_free()


func _on_button_next_pressed() -> void:
	get_tree().change_scene_to_file("res://menus/main_menu/digit_your_name.tscn")
