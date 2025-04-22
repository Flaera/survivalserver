extends ColorRect


func _process(delta):
	if (Input.is_action_just_pressed("ui_cancel")):
		get_tree().paused=false
		visible = false
		get_tree().reload_current_scene()
