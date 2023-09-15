class_name GridSquare
extends Control


func _drop_data(at_position: Vector2, data: Variant) -> void:
	print("dropped")
	data.queue_free()

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:

	if data is DragTest:
		return true
	else:
		return false
