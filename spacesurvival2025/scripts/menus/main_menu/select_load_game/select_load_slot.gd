extends Control


@onready var save1 = preload("res://resources/game_save1.tres")
@onready var save2 = preload("res://resources/game_save2.tres")
@onready var save3 = preload("res://resources/game_save3.tres")
@onready var game_settings = preload("res://resources/save_settings.tres")


func _ready() -> void:
	$VBoxContainer/HBoxContainerButtons/VBoxContainer/Label.text=save1.player_name
	$VBoxContainer/HBoxContainerButtons/VBoxContainer2/Label.text=save2.player_name
	$VBoxContainer/HBoxContainerButtons/VBoxContainer3/Label.text=save3.player_name
	
	$VBoxContainer/HBoxContainerButtons/VBoxContainer/ButtonSlot1/VBoxContainer/HBoxContainer2/Score.text=str(save1.score)
	$VBoxContainer/HBoxContainerButtons/VBoxContainer2/ButtonSlot2/VBoxContainer/HBoxContainer2/Score.text=str(save2.score)
	$VBoxContainer/HBoxContainerButtons/VBoxContainer3/ButtonSlot3/VBoxContainer/HBoxContainer2/Score.text=str(save3.score)
	
	$VBoxContainer/HBoxContainerButtons/VBoxContainer/ButtonSlot1/VBoxContainer/HBoxContainer/Lifes.text=str(save1.lifes)
	$VBoxContainer/HBoxContainerButtons/VBoxContainer2/ButtonSlot2/VBoxContainer/HBoxContainer/Lifes.text=str(save2.lifes)
	$VBoxContainer/HBoxContainerButtons/VBoxContainer3/ButtonSlot3/VBoxContainer/HBoxContainer/Lifes.text=str(save3.lifes)


func save_slot_pos_to_levels(slot_pos: int):
	#save1 = ResourceLoader.load("res://resources/game_save1.tres")
	game_settings.current_save_game=slot_pos
	ResourceSaver.save(game_settings,"res://resources/save_settings.tres")
	get_tree().change_scene_to_file("res://levels/selector_levels.tscn")


func _on_button_slot_1_pressed() -> void:
	save_slot_pos_to_levels(1)


func _on_button_slot_2_pressed() -> void:
	save_slot_pos_to_levels(2)


func _on_button_slot_3_pressed() -> void:
	save_slot_pos_to_levels(3)
	
