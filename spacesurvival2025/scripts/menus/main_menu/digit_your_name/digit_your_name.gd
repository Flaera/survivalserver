extends Control


@onready var current_save: Resource
@onready var pos_save: int = 1
@onready var game_settings: Resource = preload("res://resources/save_settings.tres")


func load_savegame():
	var current_save_game: Resource
	var position_save_game = game_settings.current_save_game
	var save_game1: Resource = load("res://resources/game_save1.tres")
	var save_game2: Resource = load("res://resources/game_save2.tres")
	var save_game3: Resource = load("res://resources/game_save3.tres")
	if (position_save_game==1):
		#print("AQUI1")
		current_save_game=save_game1
	elif (position_save_game==2):
		#print("AQUI2")
		current_save_game=save_game2
	elif (position_save_game==3):
		#print("AQUI3")
		current_save_game=save_game3
	else:
		print("Error: select one savegame!!")
	return current_save_game


func _ready() -> void:
	var line = $VBoxContainer/LineEditName
	line.grab_focus()
	#line.set_cursor_position(len(line.text)) 
	
	current_save = load_savegame()
	#print("SAVE=",current_save)


func _on_button_next_pressed() -> void:
	visible=false
	get_tree().change_scene_to_file("res://levels/world_01.tscn")


func save_in_savegame(res_pos: int, res: Resource):
	var path_save_game1: String = "res://resources/game_save1.tres"
	var path_save_game2: String = "res://resources/game_save2.tres"
	var path_save_game3: String = "res://resources/game_save3.tres"
	if (res_pos==1):
		ResourceSaver.save(res,path_save_game1)
	elif (res_pos==2):
		ResourceSaver.save(res,path_save_game2)
	elif (res_pos==3):
		ResourceSaver.save(res,path_save_game3)



func _on_line_edit_name_editing_toggled(toggled_on: bool) -> void:
	if (current_save!=null):
		current_save.player_name=String($VBoxContainer/LineEditName.text)
		save_in_savegame(pos_save, current_save)
