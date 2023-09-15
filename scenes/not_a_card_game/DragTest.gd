class_name DragTest
extends Control


func _get_drag_data(at_position: Vector2) -> Variant:
	var rect = ColorRect.new()
	rect.size = Vector2(100,100)
	
	set_drag_preview(rect)
	
	return self

