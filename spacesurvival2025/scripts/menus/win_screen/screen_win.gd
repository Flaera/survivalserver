extends ColorRect


@onready var res_game_settings = ResourceLoader.load("res://resources/save_settings.tres")
@onready var save1 = ResourceLoader.load("res://resources/game_save1.tres")
@onready var save2 = ResourceLoader.load("res://resources/game_save2.tres")
@onready var save3 = ResourceLoader.load("res://resources/game_save3.tres")


func _process(delta: float) -> void:
	if visible==true:
		if (res_game_settings.current_save_game==1):
			$VBoxContainer/Label2.text="%s, your score is %d!" % [save1.player_name,save1.score]
		elif (res_game_settings.current_save_game==2):
			#print("scores_test=",save2.score) 
			$VBoxContainer/Label2.text="%s, your score is %d!" % [save2.player_name,int(save2.score)]
		elif (res_game_settings.current_save_game==3):
			$VBoxContainer/Label2.text="%s, your score is %d!" % [save3.player_name,save3.score]
		


func _on_button_back_pressed() -> void:
	get_tree().paused=false
	get_tree().change_scene_to_file("res://levels/selector_levels.tscn")
