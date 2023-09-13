
extends Node3D

@export var do_rotation = true
@export var front : Texture2D
@export var side : Texture2D
@export var back : Texture2D

#so
#we need ONE shadow casting sprite 
#then change the other stuff based on the forward direction
#so we get the angle relative to the root really

func _process(delta: float) -> void:
	var cam = get_viewport().get_camera_3d()
	
	#get the dot product between the forward and the camera direction
	
	var camera_direction :Vector3= ( cam.global_position - position ).normalized()
	
	var dot = camera_direction.dot(transform.basis.z)
	

	if dot >= 0.5:
		$Sprite.texture = front
		
		if !do_rotation:
			$Sprite.rotation = Vector3(0,0,0)
	elif dot > -0.5:
		#depends what side we're on
		#additinal data needed
	
		#$Sprite.flip_h = (position - cam.global_position).x > 0
		$Sprite.texture = side
		if !do_rotation:
			$Sprite.rotation = Vector3(0,PI/2,0)
	else:
		$Sprite.texture = back
		$Sprite.rotation = Vector3(0,PI,0)
	#so dot is 1 when in front, -1 when in back

	
	if do_rotation:
		
		$Sprite.look_at(cam.global_position)
		$Sprite.rotation.x = 0
		$Sprite.rotation.z = 0
