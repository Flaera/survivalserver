extends ColorRect


@onready var res_game_settings = preload("res://resources/save_settings.tres")
@onready var save1 = preload("res://resources/game_save1.tres")
@onready var save2 = preload("res://resources/game_save2.tres")
@onready var save3 = preload("res://resources/game_save3.tres")


func _process(delta):
	if visible==true:
		if (res_game_settings.current_save_game==1):
			var save = save1
			$VBoxContainer/Label3.text=save.player_name+", your score is "+str(save.score)+"!"
		elif (res_game_settings.current_save_game==2):
			var save = save2
			$VBoxContainer/Label3.text=save.player_name+", your score is "+str(save.score)+"!"
		elif (res_game_settings.current_save_game==3):
			var save = save3
			$VBoxContainer/Label3.text=save.player_name+", your score is "+str(save.score)+"!"
		
		
	if (visible==true and Input.is_action_just_pressed("ui_cancel")):
		get_tree().paused=false
		visible = false
		
		get_tree().change_scene_to_file("res://menus/main_menu/main_menu.tscn")
