extends Node2D


@onready var dead: bool = false
@onready var grav: float = 0.0

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
		queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body.is_in_group("shoot")):
		#print("body=", body)
		body.queue_free()
		dead=true
		$AnimationPlayerDeath.play("death_anim")
