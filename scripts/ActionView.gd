class_name ActionView
extends Control

@export var upArrow : Texture
@export var downArrow : Texture
@export var leftArrow : Texture
@export var rightArrow : Texture



func LoadAction(action :Action):
	$HBoxContainer/ActionName.text = action.name
	$HBoxContainer/Cost.text = str(action.actionCost)
	
	match(action.direction):
		Symbols.Direction.UP:
			$HBoxContainer/ArrowTexture.texture = upArrow
		Symbols.Direction.RIGHT:
			$HBoxContainer/ArrowTexture.texture = rightArrow
		Symbols.Direction.LEFT:
			$HBoxContainer/ArrowTexture.texture = leftArrow
		Symbols.Direction.DOWN:
			$HBoxContainer/ArrowTexture.texture = downArrow
