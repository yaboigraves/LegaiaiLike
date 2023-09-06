class_name ActionRadial
extends Control

var upActionView : ActionView
var leftActionView : ActionView
var downActionView : ActionView
var rightActionView : ActionView

func _ready() -> void:
	CacheActionViews()
	
func CacheActionViews():
	upActionView = $VBoxContainer/UpAction as ActionView
	leftActionView = $VBoxContainer/LeftAction as ActionView
	downActionView = $VBoxContainer/DownAction as ActionView
	rightActionView = $VBoxContainer/RightAction as ActionView

func SetActions(entity : PlayerControlledEntity):
	if entity.upAction:
		upActionView.LoadAction(entity.upAction)
	
	if entity.leftAction:
		leftActionView.LoadAction(entity.leftAction)
	
	if entity.downAction:
		downActionView.LoadAction(entity.downAction)
	
	if entity.rightAction:
		rightActionView.LoadAction(entity.rightAction)
