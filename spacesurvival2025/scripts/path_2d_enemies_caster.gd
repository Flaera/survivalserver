extends Path2D


@onready var number_enemies: int = 20
@onready var waves: int = 1
@onready var timer: float = 0.0
@onready var current_wave = get_parent().get_node("current_enemies")
@onready var enemy1: Object = preload("res://levels/enemies/alan(16x_16).tscn")
@onready var enemy2: Object = preload("res://levels/enemies/bonbon.tscn")
@onready var enemy3: Object = preload("res://levels/enemies/lips.tscn")
@onready var first_wave = true
@onready var enemy_type
@onready var launcher_wave: bool = true
@onready var screen_win: bool = false

@export var wave_by_lv: int = 5
@export var enemies_by_wave: int = 10


func _process(_delta):
	timer += _delta
	#print("timer=",timer)
	
	if (timer>=5.0 or first_wave==true) and launcher_wave==true:
		for i in range(0,waves*enemies_by_wave):
			var pos = randf()
			$PathFollow2DCasterEnemies.progress_ratio=pos
			enemy_type = randi_range(0,2)
			var enemy
			if enemy_type==0:
				enemy = enemy1.instantiate()
			elif (enemy_type==1):
				enemy = enemy2.instantiate()
			elif (enemy_type==2):
				enemy = enemy3.instantiate()
			enemy.position.x=$PathFollow2DCasterEnemies.progress
			current_wave.add_child(enemy)
		if waves<wave_by_lv:
			waves += 1
		else:
			screen_win=true
			get_parent().get_node("CanvasLayer/ColorRectWin").visible=true
			get_tree().paused=true
		first_wave = false
		timer = 0.0
	#if (len(current_wave.get_children())>0):
	#	print("enemy1=",current_wave.get_children()[0].position)
	
	if (screen_win==true):
		get_tree().paused=true
