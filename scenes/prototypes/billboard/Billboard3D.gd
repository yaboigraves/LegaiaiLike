
extends AnimatedSprite3D

func _process(delta: float) -> void:
	var cam = get_viewport().get_camera_3d()
	
	look_at(cam.global_position)
