extends Control

@onready var save_settings: Resource = preload("res://resources/save_settings.tres")


func _on_button_back_pressed() -> void:
	visible=false
	$VBoxContainer/ButtonBack.grab_focus()
	get_parent().get_node("ControlButtons").visible=true


func _on_h_slider_value_changed(value: float) -> void:
	#print(value)
	AudioServer.set_bus_volume_db(1,value)
	save_settings.global_volume_music = value
	ResourceSaver.save(save_settings,"res://resources/save_settings.tres")


func _on_h_slider_2_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(2,value)
	save_settings.global_volume_sound_effect = value
	ResourceSaver.save(save_settings,"res://resources/save_settings.tres")
