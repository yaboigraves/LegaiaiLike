extends Node

func _ready() -> void:
	$Path3D/AnimationPlayer.play("rotate_cam")
