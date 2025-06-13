extends Node2D


@onready var dead: bool = false
@onready var grav: float = 0.0
@onready var res_game_settings = ResourceLoader.load("res://resources/save_settings.tres")
@onready var save1 = ResourceLoader.load("res://resources/game_save1.tres")
@onready var save2 = ResourceLoader.load("res://resources/game_save2.tres")
@onready var save3 = ResourceLoader.load("res://resources/game_save3.tres")
@export var texture_enemy: Texture2D
@export var h_frames: int


func _ready():
	$"Alan(16X16)".texture=texture_enemy
	$"Alan(16X16)".hframes=h_frames
	grav = randf_range(50.0,70.0)
	#gravity_scale = grav


func _process(delta: float) -> void:
	global_position.y = global_position.y+(delta*grav)
	#print("posy=",position.y)
	if (position.y > 720):
		queue_free()
	if (dead==true and not $AnimationPlayerDeath.is_playing()):
		var player = get_parent().get_parent()
		player.get_node("player").score += 2
		
		var mother = get_parent().get_parent()
		if (res_game_settings.current_save_game==1):
			save1.lifes=str_to_var(mother.get_node("CanvasLayer/VBoxContainer/HBoxContainer/Lifes").text)
			save1.score=str_to_var(mother.get_node("CanvasLayer/VBoxContainer/HBoxContainer2/Score").text)
			ResourceSaver.save(save1,"res://resources/game_save1.tres")
		elif (res_game_settings.current_save_game==2):
			save2.lifes=str_to_var(mother.get_node("CanvasLayer/VBoxContainer/HBoxContainer/Lifes").text)
			save2.score=str_to_var(mother.get_node("CanvasLayer/VBoxContainer/HBoxContainer2/Score").text)
			print(int(save2.score),"test=",str_to_var(mother.get_node("CanvasLayer/VBoxContainer/HBoxContainer2/Score").text))
			ResourceSaver.save(save2,"res://resources/game_save2.tres")
		elif (res_game_settings.current_save_game==3):
			save3.lifes=str_to_var(mother.get_node("CanvasLayer/VBoxContainer/HBoxContainer/Lifes").text)
			save3.score=str_to_var(mother.get_node("CanvasLayer/VBoxContainer/HBoxContainer2/Score").text)
			ResourceSaver.save(save3,"res://resources/game_save3.tres")
			
			
		queue_free()
		


func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body.is_in_group("shoot")):
		#print("body=", body)
		body.queue_free()
		$Area2D.queue_free()
		dead=true
		$AnimationPlayerDeath.play("death_anim")
