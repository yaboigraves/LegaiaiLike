class_name ActionView
extends Control

@export var upArrow : Texture
@export var downArrow : Texture
@export var leftArrow : Texture
@export var rightArrow : Texture

@export var direction:Vector2i

func _ready() -> void:
	var tex : Texture
	if direction == Vector2i.UP:
		tex = upArrow
	elif direction == Vector2i.DOWN:
		tex = downArrow
	elif direction == Vector2i.LEFT:
		tex = leftArrow
	elif direction + Vector2i.RIGHT:
		tex = rightArrow
		
	$HBoxContainer/ArrowTexture.texture = tex


func LoadAction(action :Action):
	$HBoxContainer/ActionName.text = action.actionName
	$HBoxContainer/Cost.text = str(action.actionCost)
