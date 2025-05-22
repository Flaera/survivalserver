extends Control


@onready var new_game: bool = false
@onready var continue_game: bool = false
@onready var steps_ship_end: int = 0
@onready var save_settings: Resource = preload("res://resources/save_settings.tres")


func _ready():
	var value_music = save_settings.global_volume_music
	var value_sound = save_settings.global_volume_sound_effect
	$"CanvasLayer/SettingsMenu/VBoxContainer/HSlider".value = value_music
	$"CanvasLayer/SettingsMenu/VBoxContainer/HSlider2".value = value_sound
	AudioServer.set_bus_volume_db(1,value_music)
	AudioServer.set_bus_volume_db(2,value_sound)
	
	$CanvasLayer/ControlButtons/VBoxContainer/ButtonNew.grab_focus()



func _process(delta: float) -> void:
	if (steps_ship_end==0 and $"Player/PlayerShip(16X16)/AnimationPlayer".is_playing()==false):
		$"Player/PlayerShip(16X16)/AnimationPlayer".play("menu_ship_idle_anim_2")
	else:
		if (steps_ship_end==1 and new_game==true
		 and $"Player/PlayerShip(16X16)/AnimationPlayer".is_playing()==false):
			steps_ship_end+=1
			#NEW GAME
			var new_game_scene = load("res://menus/main_menu/select_save_slot.tscn")
			var ng_instantiate = new_game_scene.instantiate()
			$CanvasLayer.add_child(ng_instantiate)
		elif (steps_ship_end==1 and continue_game==true
		 and $"Player/PlayerShip(16X16)/AnimationPlayer".is_playing()==false):
			steps_ship_end+=1
			print("CONTINUE!!")
			#CONTINUE GAME



func ship_run_out_screen():
	if (steps_ship_end==1):
		$"Player/PlayerShip(16X16)/AnimationPlayer".play("ship_go_out_screen_anim")



func _on_button_new_pressed() -> void:
	$"CanvasLayer/ControlButtons/AnimationPlayer".play("go_out_buttons_anim")
	if (steps_ship_end==0):
		new_game=true
		steps_ship_end+=1
	$"Player/PlayerShip(16X16)/AnimationPlayer".stop(true)
	ship_run_out_screen()


func _on_button_continue_pressed() -> void:
	$"CanvasLayer/ControlButtons/AnimationPlayer".play("go_out_buttons_anim")
	if (steps_ship_end==0):
		continue_game=true
		steps_ship_end+=1
	#$"Player/PlayerShip(16X16)/AnimationPlayer".stop(true)
	ship_run_out_screen()


func _on_button_settings_pressed() -> void:
	$"CanvasLayer/ControlButtons".visible=false
	$"CanvasLayer/SettingsMenu".visible=true
	get_node("CanvasLayer/SettingsMenu/VBoxContainer/ButtonBack").grab_focus()


func _on_button_exit_pressed() -> void:
	get_tree().quit()
