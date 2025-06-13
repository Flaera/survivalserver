extends Control


@onready var game_settings: Resource = preload("res://resources/save_settings.tres")


func load_slots_data():
	var save1 = load("res://resources/game_save1.tres")
	var save2 = load("res://resources/game_save2.tres")
	var save3 = load("res://resources/game_save3.tres")
	$VBoxContainer/HBoxContainerButtons/VBoxContainer/Label.text=save1.player_name
	$VBoxContainer/HBoxContainerButtons/VBoxContainer2/Label.text=save2.player_name
	$VBoxContainer/HBoxContainerButtons/VBoxContainer3/Label.text=save3.player_name
	
	$VBoxContainer/HBoxContainerButtons/VBoxContainer/ButtonSlot1/VBoxContainer/HBoxContainer2/Score.text=str(save1.score)
	$VBoxContainer/HBoxContainerButtons/VBoxContainer2/ButtonSlot2/VBoxContainer/HBoxContainer2/Score.text=str(save2.score)
	$VBoxContainer/HBoxContainerButtons/VBoxContainer3/ButtonSlot3/VBoxContainer/HBoxContainer2/Score.text=str(save3.score)
	
	$VBoxContainer/HBoxContainerButtons/VBoxContainer/ButtonSlot1/VBoxContainer/HBoxContainer/Lifes.text=str(save1.lifes)
	$VBoxContainer/HBoxContainerButtons/VBoxContainer2/ButtonSlot2/VBoxContainer/HBoxContainer/Lifes.text=str(save2.lifes)
	$VBoxContainer/HBoxContainerButtons/VBoxContainer3/ButtonSlot3/VBoxContainer/HBoxContainer/Lifes.text=str(save3.lifes)


func erase_save_slot(res_pos: int):
	var save1 = load("res://resources/game_save1.tres")
	var save2 = load("res://resources/game_save2.tres")
	var save3 = load("res://resources/game_save3.tres")
	if (res_pos==1):
		save1.player_name = ""
		save1.score = 0
		save1.lifes = 0
	elif (res_pos==2):
		save2.player_name = ""
		save2.score=0
		save2.lifes=0
	elif (res_pos==3):
		save3.player_name = ""
		save3.score=0
		save3.lifes=0
	


func _ready() -> void:
	load_slots_data()
	$VBoxContainer/HBoxContainer/ButtonBack.grab_focus()


func go_warning(pos_save: int):
	erase_save_slot(pos_save)
	game_settings.current_save_game=pos_save
	ResourceSaver.save(game_settings,"res://resources/save_settings.tres")
	#queue_free()
	add_child(load("res://menus/main_menu/warning_new_game.tscn").instantiate())
	


func _on_button_slot_1_pressed() -> void:
	go_warning(1)


func _on_button_slot_2_pressed() -> void:
	go_warning(2)
	


func _on_button_slot_3_pressed() -> void:
	go_warning(3)


func _on_button_back_pressed() -> void:
	var mother = get_parent()
	#mother.get_node("ControlButtons/AnimationPlayer").play("go_out_buttons_anim")
	#mother.get_node("ControlButtons/AnimationPlayer").play("go_out_buttons_anim")
	mother.get_node("ControlButtons/VBoxContainer/ButtonNew").grab_focus()
	get_tree().reload_current_scene()
	queue_free()
	
