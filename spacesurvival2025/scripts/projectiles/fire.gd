extends Node2D


@onready var speed: float = 300.0


func _ready():
	$AudioStreamPlayer.play()


func _process(_delta):
	#print("ON FIRING!!",position.y)
	if (global_position.y > -420):
		global_position.y = global_position.y - (speed * _delta)
	else:
		queue_free()
