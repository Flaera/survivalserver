extends CharacterBody2D

@export var score: int = 0
@onready var fire: Object = preload("res://levels/Fire.tscn")
@onready var max_cooldown: float = 0.2
@onready var cooldown: float = max_cooldown
@onready var hearts: int = 5
@onready var load_hearts: bool = false
@onready var cooldown_hearts: float = 3.0
const SPEED = 300.0


func _process(delta):
	if (hearts<=0):
		get_parent().get_node("CanvasLayer/ColorRect").visible=true
		get_tree().paused=true


func _physics_process(_delta: float) -> void:
	if (Input.is_action_pressed("ui_accept") and $Timer.is_stopped()):
		$Timer.start(0.5)
		var fire0 = fire.instantiate()
		fire0.position = Vector2(position.x-3.39,position.y)
		get_parent().get_node("Fires").add_child(fire0)
		var fire1 = fire.instantiate()
		fire1.position = Vector2(position.x+3.39,position.y)
		get_parent().get_node("Fires").add_child(fire1)
	
	get_parent().get_node("CanvasLayer/VBoxContainer/HBoxContainer2/Score").text=str(score)
	get_parent().get_node("CanvasLayer/VBoxContainer/HBoxContainer/Lifes").text=str(hearts)
	
	var directionY := Input.get_axis("ui_up", "ui_down")
	if directionY:
		velocity.y = directionY * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionX := Input.get_axis("ui_left", "ui_right")
	if (directionX==-1):
		$anim.frame=0
	elif (directionX==1):
		$anim.frame=2
	else:
		$anim.frame=1
	if directionX:
		velocity.x = directionX * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_area_2d_player_area_entered(area: Area2D) -> void:
	#print("AQUI,=",area)
	if (area.is_in_group("enemies") and area.get_parent().dead==false):
		
		hearts-=1
		$AnimationPlayer.play("res://animations/death_anim.res")
